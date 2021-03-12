//
//  EGLogViewController.swift
//  SimonDiceEmmanuel
//
//  Created by Mac09 on 12/03/21.
//  Copyright © 2021 Nameless Group. All rights reserved.
//

import UIKit

class EGLogViewController: UIViewController{
    
    @IBOutlet weak var EGJugador: UITextField!
    @IBOutlet weak var EGJugar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EGJugar.redondo()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is Game_ViewController {
            let vc = segue.destination as? Game_ViewController
            vc?.jugador = EGJugador.text!        }
     
       
    }
    
    @IBAction func EGJuega(_ sender: Any) {
        if !EGJugador.text!.isEmpty{
        
               }else{
                   self.defecto(withTitle: "El jugador??", withMsg: "No ingresaste el jugador compa")        }
    }
    
}


