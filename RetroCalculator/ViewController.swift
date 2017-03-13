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

    @IBOutlet weak var resultsLabel: UILabel!
    
    var btnSound: AVAudioPlayer!
   
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var leftValueStr = ""
    var resultStr = ""
    var rightValueStr = ""
    var runningNumber = ""
    
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
        
        runningNumber += "\(sender.tag)"
        resultsLabel.text = runningNumber
    }
    
    func playSound(){
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    
    func processOperation(operation:Operation){
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightHandValue = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftHandValue) * )
                }else if currentOperation == Operation.Divide {
                    
                }else if currentOperation == Operation.Subtract {
                    
                }else if currentOperation == Operation.Add {
                    
                }
            }
                
        }
            
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

