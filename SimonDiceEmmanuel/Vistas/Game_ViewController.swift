//
//  JuegoViewController.swift
//  SimonDiceEmmanuel
//
//  Created by Mac09 on 12/03/21.
//  Copyright © 2021 Nameless Group. All rights reserved.
//

import UIKit

class Game_ViewController: UIViewController {
    
    
    var jugador:String = ""
    @IBOutlet weak var EGJugador: UILabel!
    @IBOutlet weak var EGScore: UILabel!
    @IBOutlet weak var EGBest: UILabel!
    @IBOutlet weak var EGEstatus: UILabel!
    
    
    
    
    
    var orden = [UIButton]()
    var contar = 3
    var inicial = 0
    var puntos = 0 {
        didSet{
            EGScore.text = "\(puntos) puntos"
        }
    }
    
    @IBOutlet weak var EGAma: UIButton!
    @IBOutlet weak var EGRo: UIButton!
    @IBOutlet weak var EGVe: UIButton!
    @IBOutlet weak var EGAz: UIButton!
    @IBOutlet weak var EGGuard: UILabel!
    
    var colores = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EGJugador?.text = jugador
        let mejor = EG_User.mejorpunt()
        EGBest?.text = mejor?.Ename ?? "None"
        EGGuard?.text = "\(mejor?.Escore ?? 0) points"
        colores = [EGAma, EGRo, EGVe, EGAz]
        
        self.NuevoJuego()
        // Do any additional setup after loading the view.
    }
    
    
    func NuevoJuego() {
        EGEstatus?.isHidden = true
        puntos = 0
        orden.removeAll()
        contar = 3
        Timer.scheduledTimer(timeInterval: 0.666, target: self, selector: #selector(Game_ViewController.update), userInfo: nil, repeats : true)
        
    }
    
    
    @IBAction func EGPresion(_ sender: UIButton) {
        self.Mover(sender)
    }
    
    
    @objc func update(){
        if contar > 0 {
            contar -= 1
            inicial += 1
        }else if contar == 0 {
            contar -= 1
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                self.colores.forEach{(color) in
                    color.alpha = 0.5
                    color.setTitle("", for: UIControl.State.normal)
                }
            }
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                
                self.secuencia()
            }
        }
    }
    
    func secuencia(){
        orden.append(colores.randomElement()!)
        inicial = 0
        viendo = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.siguiente()
        }
    }
    
    var viendo = true {
        didSet {

        }
    }
    
    func siguiente(){
        guard inicial < orden.count else{
            viendo = false
            inicial = 0
            return
        }
        let button = orden[inicial]
        inicial+=1
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { timer in
            button.alpha = 1
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            button.alpha = 0.5
            self.siguiente()
        }
        
    }
    
    
    func Mover(_ color:UIButton){
        guard viendo == false else { return }
        color.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
            color.alpha = 0.5
        }
        if orden[inicial] == color {
            inicial += 1
            if inicial == orden.count {
                puntos += 10
                secuencia()
            }
        } else {
            viendo = true
            EGEstatus?.text = "GAME OVER"
            self.EGEstatus?.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func GuardarUsuaio(){
        if !EG_User.siExiste(EGJugador.text!){
            let user = EG_User(EGJugador.text!, self.puntos)
            user.agregar()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        GuardarUsuaio()
        
    }
    
    
}
