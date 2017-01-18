//
//  characterClass.swift
//  calculatorForCodeCamp
//
//  Created by 中村俊允 on 2016/12/31.
//  Copyright © 2016年 Toshimitsu Nakamura. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

var audioPlayerClear : AVAudioPlayer! = nil
var audioPlayerClear2 : AVAudioPlayer! = nil



class Character {
    //レベル
    //HP
    //対応するイメージビュー
    //画像
    var level: Int
    var hp: Int
    var strength: Int
    var imageView: UIImageView!
    var image: UIImage!
    var imageNum: Int
    var imageString: [String]
    var imageLength: Int
        
    // イニシャライザ
    init(level: Int = 1, imageStr: [String]) {
        self.level = level
        self.hp = 10 * level
        self.strength = 5 * level
        self.image = UIImage(named : imageStr[0])!
        self.imageLength = imageStr.count
        self.imageNum = 0
        self.imageString = imageStr
    }
    
    func reset() {
        self.hp = 10 * level
        self.strength = 5 * level
    }
    
    func setImageView(imageView: UIImageView) {
        self.imageView = imageView
        self.imageView.image = self.image
    }
    
    // レベルUP メソッド
    func levelUp() {
        self.Sound(name1:"se_maoudamashii_onepoint23", name2:"mp3", audio: &audioPlayerClear2)
        self.level += 1
        self.changeImage(image : "mon_199.gif")
        //レベルアップ時のエフェクトを何か追加
    }
    func randomAction(enemy: Character!){
        switch Int(arc4random_uniform(UInt32(99))%2) {
        case 0:
            self.attack(enemy: enemy)
        default:
            enemy.attack(enemy: self)
        }
        
    }
    // 攻撃時ダメージ計算
    func attack(enemy: Character!) -> String {
        enemy.Animation(imageView: enemy.imageView)
        self.Sound(name1:"attack", name2:"wav", audio: &audioPlayerClear)
        enemy.hp -= ( strength - Int(arc4random_uniform(UInt32(strength / level))) ) // 計算適当
        enemy.hp = enemy.hp < 0 ? 0 : enemy.hp
        if enemy.hp == 0 && enemy.imageString[0].contains("mon_") {
            print("0です")
            enemy.changeImage(image : "mon_193.gif")
            enemy.reset()
            self.levelUp()
            
        } else if enemy.hp == 0 && enemy.imageString[0].contains("chara") {
            self.Sound(name1:"death", name2:"mp3", audio: &audioPlayerClear2)
            enemy.level = enemy.level > 1 ? enemy.level - 1 : 1
            enemy.imageNum = (0<enemy.imageNum) ? enemy.imageNum - 1 : 0
            enemy.imageView.image = UIImage(named : enemy.imageString[enemy.imageNum])!
            enemy.reset()
        } else {
            //self.Sound(name1:"se_maoudamashii_onepoint23", name2:"mp3", audio: &audioPlayerClear2)
            print("0未満です")
        }
        return "you"
    }
    
    func changeImage(image: String = "mon_193.gif") {
        self.imageNum = (self.imageLength>self.imageNum + 1) ? self.imageNum + 1 : self.imageNum
        self.imageView.image = UIImage(named : self.imageString[self.imageNum])!
        self.level += (self.imageLength>self.imageNum + 1) ? 3 : 0
    }
    //音声の出力
    func Sound(name1:String, name2:String, audio:inout AVAudioPlayer!){
        
        //音声ファイルのパスを作る。
        let soundFilePathClear : NSString = Bundle.main.path(forResource: name1, ofType: name2)! as NSString
        let soundClear : NSURL = NSURL(fileURLWithPath: soundFilePathClear as String)
        //AVAudioPlayerのインスタンス化
        do{
            audio = try AVAudioPlayer(contentsOf: soundClear as URL, fileTypeHint:nil)
        }catch{
            print("Failed AVAudioPlayer Instance")
        }
        //出来たインスタンスをバッファに保持する。
        audio.prepareToPlay()
        audio.play()

    }
    
    
    func Animation(imageView : UIImageView) {
        UIView.animate(withDuration: 0.2,               // アニメーションの時間
            delay: 0.0,                               // 遅延時間
            options: UIViewAnimationOptions.repeat,   // 繰り返し
            animations: { () -> Void in               // アニメーションする処理
                imageView.alpha = 0.0            // alpha = 0.0 で透明に
        },
            completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            // 0.5秒後に実行したい処理
            imageView.layer.removeAllAnimations()
            imageView.alpha = 1.0
        }
    }
}
