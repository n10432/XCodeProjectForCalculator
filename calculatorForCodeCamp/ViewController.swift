//
//  ViewController.swift
//  calculatorForCodeCamp
//
//  Created by 中村俊允 on 2016/12/12.
//  Copyright © 2016年 Toshimitsu Nakamura. All rights reserved.
//

import UIKit

func dealWithTextField(var textField:UITextField!, var num:String) {
    if textField.text! != "0" {
        textField.text = textField.text! + num
    }
    else{
        textField.text = num
    }
}

class ViewController: UIViewController {
    var MyCalcClass:calcClass = calcClass()
    var tempResult:String = ""

    @IBOutlet weak var mainTextField: UITextField!
    
    @IBAction func deleteButton(_ sender: Any) {
        mainTextField.text = "0"
    }
    @IBAction func button0(_ sender: Any) {
        mainTextFieldtextFieldmainTextField.text! + "0"
    }
    @IBAction func button1(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "1"
    }
    @IBAction func button2(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "2"
    }
    @IBAction func button3(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "3"
    }
    @IBAction func button4(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "4"
    }
    @IBAction func button5(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "5"
    }
    @IBAction func button6(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "6"
    }
    @IBAction func button7(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "7"
    }
    @IBAction func button8(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "8"
    }
    @IBAction func button9(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "9"
    }
    @IBAction func buttonPeriod(_ sender: Any) {
        mainTextField.text = mainTextField.text! + "."
    }
    @IBAction func buttonDiv(_ sender: Any) {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "/"))
        mainTextField.text = tempResult
    }
    @IBAction func buttonMult(_ sender: Any) {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "*"))
        mainTextField.text = tempResult
    }
    @IBAction func buttonSub(_ sender: Any) {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "-"))
        mainTextField.text = tempResult
    }
    @IBAction func buttonAdd(_ sender: Any) {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "+"))
        mainTextField.text = tempResult
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

