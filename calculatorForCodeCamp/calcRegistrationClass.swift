//
//  calcRegistrationClass.swift
//  calculatorForCodeCamp
//
//  Created by 中村俊允 on 2016/12/27.
//  Copyright © 2016年 Toshimitsu Nakamura. All rights reserved.
//

import Foundation
class calcClass {
    var num1:Double = 0.0
    var num2:Double = 0.0
    var operator1:String = ""
    var operator2:String = ""
    
    //演算子情報を記録する
    func addOperator(num:String, operaterTemp:String) -> Double{
        self.num2 = atof(num)
        self.operator2 = operaterTemp
        self.execCalc()
        return self.num1
    }
    func clear() {
        self.num1 = 0.0
        self.num2 = 0.0
        self.operator1 = ""
        self.operator2 = ""
    }
    func changeOperator(input:String) {
        self.operator1 = input
    }
    //計算を実行
    func execCalc(){
        switch self.operator1 {
        case "plus":
            self.num1 = self.num1 + self.num2
            self.operator1 = self.operator2
        case "minus":
            self.num1 = self.num1 - self.num2
            self.operator1 = self.operator2
        case "multi":
            self.num1 = self.num1 * self.num2
            self.operator1 = self.operator2
        case "div":
            self.num1 = self.num1 / self.num2
            self.operator1 = self.operator2
        default:
            self.num1 = self.num2
            self.operator1 = self.operator2
        }
    }
}
