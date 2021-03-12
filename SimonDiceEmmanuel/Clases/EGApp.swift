//
//  EGApp.swift
//  SimonDiceEmmanuel
//
//  Created by Mac09 on 12/03/21.
//  Copyright © 2021 Nameless Group. All rights reserved.
//

import UIKit

class EG_App: NSObject {
    static let shared = EG_App()
    let defaults = UserDefaults.standard
    var users = [EG_User]()
}
