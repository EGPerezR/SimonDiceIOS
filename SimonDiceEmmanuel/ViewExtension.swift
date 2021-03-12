//
//  ViewExtension.swift
//  SimonDiceEmmanuel
//
//  Created by Mac09 on 12/03/21.
//  Copyright © 2021 Nameless Group. All rights reserved.
//

import UIKit

extension UIView {
    func redondo(){
        self.layer.cornerRadius = self.bounds.height / 2
        
    }
    
}


extension UIViewController{
    func defecto(withTitle title: String, withMsg msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
