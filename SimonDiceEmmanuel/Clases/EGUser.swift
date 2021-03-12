//
//  EGUser.swift
//  SimonDiceEmmanuel
//
//  Created by Mac09 on 12/03/21.
//  Copyright © 2021 Nameless Group. All rights reserved.
//

import UIKit

class EG_User: Codable{
    var Ename:String!
    var Escore:Int!
    
    init(_ Ename:String, _ Escore:Int) {
        self.Ename = Ename
        self.Escore = Escore
        
    }
    
    func store(){
        do{
            let encoder = JSONEncoder()
            let data = try
                encoder.encode(EG_App.shared.users)
            EG_App.shared.defaults.set(data, forKey: "users")
            EG_App.shared.defaults.synchronize()
        }catch{
            print("Error:\(error)")
        }
    }
    
    func agregar(){
        EG_App.shared.users = EG_User.Indice()
        EG_App.shared.users.append(self)
        self.store()
        
    }
    
    
    static func siExiste(_ name:String) -> Bool {
        let users = EG_User.Indice()
        var status = false
        users.forEach{(user) in
            if(user.Ename == name){
                status = true
            }
        }
        return status
    }
    
    
    static func Indice() -> [EG_User]{
        if let data = EG_App.shared.defaults.object(forKey: "users") as? Data {
            let decoder = JSONDecoder()
            guard let users = try? decoder.decode([EG_User].self, from: data)
                else{ return [EG_User]() }
            return users
        }
        return [EG_User]()
    }
    
    static func mejorpunt() -> EG_User?{
        let users = EG_User.Indice()
        if(users.count > 0){
            let max_user: EG_User = users.max(by: {$0.Escore < $1.Escore})!
            return max_user
        }
        return nil
    }}
