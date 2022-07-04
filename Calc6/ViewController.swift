//
//  ViewController.swift
//  Calc6
//
//  Created by Consultant on 7/2/22.
//

import UIKit

enum Operation:String{
    case Add = "+"
    case Substract = "-"
    case Multiply = "*"
    case Divide = "/"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputlabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOp:Operation = .NULL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputlabel.text = runningNumber
    }

    @IBAction func DivPrssd(_ sender: UIButton) {
        
        operation(operation: .Divide)
        
    }
    @IBAction func MultPrssd(_ sender: UIButton) {
        
        operation(operation: .Multiply)
        
    }
    @IBAction func MinusPrssd(_ sender: UIButton) {
        
        operation(operation: .Substract)
    }
    
    @IBAction func plusprssd(_ sender: UIButton) {
        
        operation(operation: .Add)
    }
    @IBAction func Equal(_ sender: UIButton) {
        
        operation(operation: currentOp)
    }
    @IBAction func nbrPressed(_ sender: UIButton) {
        if runningNumber.count <= 8{
        runningNumber += "\(sender.tag)"
            outputlabel.text = runningNumber}
    }
    
    
    
    @IBAction func dorPr2(_ sender: UIButton) {
        if runningNumber.count <= 7{runningNumber += "."
            outputlabel.text = runningNumber}
    }
    
    @IBAction func AllClearPrssd(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOp = .NULL
        outputlabel.text = "0"
        
        
    }
    
    func operation(operation: Operation){
        if currentOp != .NULL{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOp == .Add{
                    
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    
                }else if currentOp == .Substract{
                    
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    
                }else if currentOp == .Multiply{
                    
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    
                }else if currentOp == .Divide{
                    
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    
                }
                
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1)==0){
                    result = "\(Int(Double(result)!))"
                }
                outputlabel.text = result
                
            }
            currentOp = operation
            
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOp = operation
        }
    }
}

