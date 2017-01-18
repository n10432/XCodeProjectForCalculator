//
//  ViewController.swift
//  calculatorForCodeCamp
//
//  Created by 中村俊允 on 2016/12/12.
//  Copyright © 2016年 Toshimitsu Nakamura. All rights reserved.
//

import UIKit
import AVFoundation

var monster: [String] = ["mon_051.gif", "mon_052.gif", "mon_053.gif", "mon_054.gif", "mon_055.gif", "mon_057.gif", "mon_058.gif", "mon_061.gif", "mon_062.gif", "mon_063.gif", "mon_065.gif", "mon_066.gif", "mon_067.gif", "mon_068.gif", "mon_069.gif", "mon_070.gif", "mon_192.gif", "mon_193.gif", "mon_196.gif", "mon_197.gif", "mon_198.gif", "mon_219.gif", "mon_220.gif"]
var character: [String] = ["chara1.gif", "chara2.gif", "chara3.gif"]


var mikata:Character = Character(imageStr: character)
var teki:Character = Character(imageStr: monster)
var audioPlayer : AVAudioPlayer! = nil

func BGM(){
    
    //音声ファイルのパスを作る。
    let soundFilePathClear : NSString = Bundle.main.path(forResource: "f008_forest8", ofType: "mp3")! as NSString
    let soundClear : NSURL = NSURL(fileURLWithPath: soundFilePathClear as String)
    //AVAudioPlayerのインスタンス化
    do{
        audioPlayer = try AVAudioPlayer(contentsOf: soundClear as URL, fileTypeHint:nil)
    }catch{
        print("Failed AVAudioPlayer Instance")
    }
    audioPlayer.numberOfLoops = -1
    //出来たインスタンスをバッファに保持する。
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
}

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
    private var _stopAnimation = false
    @IBOutlet weak var characterBE: UIImageView!
    @IBOutlet weak var character: UIImageView!
    @IBOutlet weak var monster: UIImageView!
    @IBOutlet weak var monsterBE: UIImageView!
    //var mikata:Character?
    //var teki:Character?
    
    //画像点滅用
    var timer: Timer!

    @IBAction func damageTest(_ sender: Any) {
        mikata.attack(enemy: teki)
        print("test")
    }
    
    
    @IBOutlet weak var mainTextField: UITextField!

    //主人公へのバトルエフェクトview
    //主人公のview
    //敵のview
    //敵のバトルエフェクトview

    
    
    @IBAction func deleteButton(_ sender: Any) {
        mainTextField.text = "0"
        MyCalcClass.clear()
    }
    @IBAction func button0(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "0", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button1(_ sender: Any) {
        
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "1", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button2(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "2", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button3(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "3", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button4(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "4", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button5(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "5", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button6(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "6", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button7(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "7", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button8(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "8", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func button9(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: "9", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func buttonPeriod(_ sender: Any) {
        mainTextField.text = dealWithTextField(textField: mainTextField.text!, num: ".", lastButton:lastButton)
        lastButton = "0"
        mikata.randomAction(enemy: teki)
    }
    @IBAction func buttonDiv(_ sender: Any) {
        mikata.randomAction(enemy: teki)
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "div")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "div"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonMult(_ sender: Any) {
        mikata.randomAction(enemy: teki)
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "multi")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "multi"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonSub(_ sender: Any) {
        mikata.randomAction(enemy: teki)
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "minus")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "minus"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonAdd(_ sender: Any) {
        mikata.randomAction(enemy: teki)
        if lastButton == "operator" {
            MyCalcClass.changeOperator(input: "plus")
        }else {
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "plus"))
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        }
    }
    @IBAction func buttonEqual(_ sender: Any) {
        mikata.randomAction(enemy: teki)
        tempResult = String(MyCalcClass.addOperator(num: mainTextField.text!, operaterTemp: "="))
        print(tempResult)
        mainTextField.text = checkIntOrDouble(numText:tempResult)
        lastButton = "operator"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mikata.setImageView(imageView: character)
        teki.setImageView(imageView: monster)
        let image = UIImage(named : "forest.png")!
        
        gameDisplay.image = image
        // Do any additional setup after loading the view, typically from a nib.
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        BGM()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

