//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Jason Gagnon on 10/25/16.
//  Copyright © 2016 Jason Gagnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num1:Double? = 0, num2:Double? = 0
    var op:String? = "="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtFeedback.text = "0"
        lblFeedback.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var txtFeedback: UITextField!
    @IBOutlet weak var lblFeedback: UILabel!
    
    var dotUsed = false
    var operUsed = false
    var firstNum = true
    
    @IBAction func btnPressNumber(sender: UIButton) {
        //var answer:Double? = 0
        let buttonTxt = sender.title(for: .normal)
        var txtText = txtFeedback.text
        //let text = lblFeedback.text
        
        if(buttonTxt == "+" || buttonTxt == "-" || buttonTxt == "/" || buttonTxt == "*"){
            if(operUsed){
                lblFeedback.text = "Pick a number!"
            }
            else{
                num1 = Double(txtText!)
                op = buttonTxt
                //lblFeedback.text = ""
                txtFeedback.text = ""
                dotUsed = false
                operUsed = true
            }
        }
        else{
            if(firstNum){
                txtText = ""
                firstNum = false
            }
            if(buttonTxt != "."){
                txtFeedback.text = txtText! + buttonTxt!
            }
            else if(buttonTxt == "." && !dotUsed){
                if(txtText == ""){
                    txtFeedback.text = txtText! + "0" + buttonTxt!
                }
                else{
                    txtFeedback.text = txtText! + buttonTxt!
                }
                dotUsed = true
            }
            //lblFeedback.text = text! + buttonTxt!
            operUsed = false
            lblFeedback.text = ""
        }
    }
    
    @IBAction func btnEquals(sender: UIButton){
        let txtText = txtFeedback.text
        var answer:Double? = 0
        num2 = Double(txtText!)
        let oper: Character = Character(op!)
        switch oper{
            case "+":
                answer = num1! + num2!
            case "-":
                answer = num1! - num2!
            case "/":
                answer = num1! / num2!
            case "*":
                answer = num1! * num2!
            default:
                answer = 0;
        }
        //lblFeedback.text = String(answer!)
        txtFeedback.text = String(answer!)
        dotUsed = true
    }
    
    @IBAction func btnClear(sender: UIButton) {
        lblFeedback.text = ""
        txtFeedback.text = "0"
        num1 = 0
        num2 = 0
        op = "="
        dotUsed = false
        firstNum = true
        operUsed = false
    }
}

