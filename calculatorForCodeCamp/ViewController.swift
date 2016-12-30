//
//  ViewController.swift
//  calculatorForCodeCamp
//
//  Created by 中村俊允 on 2016/12/12.
//  Copyright © 2016年 Toshimitsu Nakamura. All rights reserved.
//

import UIKit

//計算結果表示部がうまく表示できるように処理
func dealWithTextField(textField:String, num:String, lastButton:String) -> String {
    var resultText:String = ""
    if (textField != "0") && (lastButton != "operator"){
        resultText = textField + num
    } else if num == "." {
        resultText = textField + num
    } else {
        resultText = num
    }
    if (textField.contains(".")) && (num == ".") {
        resultText = textField
    }
    return resultText
}
//小数点以下が非常に小さい場合、整数として表示する
func checkIntOrDouble (numText:String) -> String {
    if numText == "nan" {
        return "ERROR"
    }
    let temp:Double = atof(numText) - Double(Int(atof(numText)))
    if fabs(temp) < 0.000000001 {
        return String(Int(atof(numText)))
    }else {
        return numText
    }
}


class ViewController: UIViewController {
    var lastButton:String = ""
    var MyCalcClass:calcClass = calcClass()
    var tempResult:String = ""
    @IBOutlet weak var gameDisplay: UIImageView!
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var scale:CGFloat = 1.0
    
    @IBOutlet weak var mainTextField: UITextField!
    
    @IBAction func changeImage(_ sender: Any) {
        let image = UIImage(named : "forest.png")!
        // 画像の幅・高さの取得
        width = image.size.width
        height = image.size.height
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale*0.5)
        gameDisplay.frame = rect
        
        //gameDisplay.contentMode = UIViewContentMode.scaleAspectFit
        //gameDisplay.contentMode = UIViewContentMode.center
        gameDisplay.image = image
    }
    @IBAction func deleteButton(_ sender: Any) {
        mainTextField.text = "0"
        MyCalcClass.clear()
    }
    @IBAction func button0(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "0", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button1(_ sender: Any) {
        
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "1", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button2(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "2", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button3(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "3", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button4(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "4", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button5(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "5", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button6(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "6", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button7(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "7", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button8(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "8", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func button9(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "9", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func buttonPeriod(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: ".", lastButton:lastButton)
        lastButton = "0"
    }
    @IBAction func buttonDiv(_ sender: Any) {
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "/")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "/"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonMult(_ sender: Any) {
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "*")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "*"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonSub(_ sender: Any) {
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "-")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "-"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonAdd(_ sender: Any) {
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "+")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "+"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonEqual(_ sender: Any) {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "="))
        print(tempResult)
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

