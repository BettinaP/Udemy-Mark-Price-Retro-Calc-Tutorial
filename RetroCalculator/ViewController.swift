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
        resultsLabel.text = "0"
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
    
    
    @IBAction func dividePressed(sender: UIButton){
        processOperation(operation: .Divide)
    }
    
    @IBAction func multiplyPressed(sender: UIButton){
        processOperation(operation: .Multiply)
    }
    
    @IBAction func subtractPressed(sender: UIButton){
        processOperation(operation: .Subtract)
    }
    
    @IBAction func addPressed(sender: UIButton){
        processOperation(operation: .Add)
    }
    
    @IBAction func equalPressed(sender:UIButton){
        processOperation(operation: currentOperation)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        
        runningNumber = ""
        resultsLabel.text = "0"
        currentOperation = Operation.Empty
        
    }
    
    
    
    func playSound(){
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    
    func processOperation(operation:Operation){
        playSound()
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValueStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    resultStr = "\(Double(leftValueStr)! * Double(rightValueStr)!)"
                } else if currentOperation == Operation.Divide {
                    resultStr = "\(Double(leftValueStr)! / Double(rightValueStr)!)"
                } else if currentOperation == Operation.Subtract {
                    resultStr = "\(Double(leftValueStr)! - Double(rightValueStr)!)"
                } else if currentOperation == Operation.Add {
                    resultStr = "\(Double(leftValueStr)! + Double(rightValueStr)!)"
                }
                
                leftValueStr = resultStr
                resultsLabel.text = resultStr
            }
            currentOperation = operation
        } else {
            //first time an operator has been pressed
            leftValueStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

