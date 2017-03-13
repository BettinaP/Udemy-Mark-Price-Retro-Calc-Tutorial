//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Bettina on 3/12/17.
//  Copyright © 2017 Bettina Prophete. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    
    @IBAction func numberPressed(sender: UIButton){
        playSound()
    }
    
    func playSound(){
        
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

