//
//  ViewController.swift
//  volado
//
//  Created by JOSE FELIPE HERRERA RODRIGUEZ on 07/08/15.
//  Copyright (c) 2015 JOSE FELIPE HERRERA RODRIGUEZ. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var moneda: UIImageView!
    var ran:NSTimeInterval = 0.0
    var suerte:Int = 0
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var boton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func hecharVolado(sender: AnyObject) {
        playSound()
        boton.enabled = false
        var a:Int=2
        var k: Int = 7 + random() % 2
        suerte = random() % 2
        println(suerte)
        println(k)
         moneda.image = UIImage(named: "monedaSinCara")
        for a in 0...k{
         var timer4 = NSTimer.scheduledTimerWithTimeInterval(ran, target: self, selector: Selector("volado"), userInfo: nil, repeats: false)
         ran=ran+0.5
        }
        
    }
    func playSound()
    {
        //
        let soundURL = NSBundle.mainBundle().URLForResource("volado", withExtension: "mp3")
        audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer.play()
        //
    }
    
    func volado()
    {
    var timer1 = NSTimer.scheduledTimerWithTimeInterval(0.0, target: self, selector: Selector("chica"), userInfo: nil, repeats: false)
    var timer2 = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("grande"), userInfo: nil, repeats: false)
    var timer3 = NSTimer.scheduledTimerWithTimeInterval(ran, target: self, selector: Selector("habilitarBoton"), userInfo: nil, repeats: false)
 
    }
    
    func chica()
    {
        let bounds = self.moneda.bounds
        UIView.animateWithDuration(0.3, animations: {
            self.moneda.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width - 160, height: bounds.size.height)
            })
    }
    func grande ()
    {
        let bounds = self.moneda.bounds
        UIView.animateWithDuration(0.3, animations: {
            self.moneda.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width - 160, height: bounds.size.height)
        })
    }
    
    func habilitarBoton()
    {
        boton.enabled = true
        ran=0.0
        cambiarMoneda()
    }
    
    func cambiarMoneda()
    {
        if suerte == 0{
            moneda.image = UIImage(named: "monedaCruz")
        } else if suerte == 1 {
            moneda.image = UIImage(named: "monedaCara")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

