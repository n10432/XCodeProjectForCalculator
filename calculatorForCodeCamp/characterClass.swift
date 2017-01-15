//
//  characterClass.swift
//  calculatorForCodeCamp
//
//  Created by 中村俊允 on 2016/12/31.
//  Copyright © 2016年 Toshimitsu Nakamura. All rights reserved.
//

import Foundation
import UIKit

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

        
    // イニシャライザ
    init(level: Int = 1, image: String = "mon_191.gif", imageView: UIImageView) {
        self.level = level
        self.hp = 100 * level
        self.strength = 1 * level
        self.image = UIImage(named : image)!
        self.imageView = imageView
        self.imageView.image = self.image
    }
    // レベルUP メソッド
    func levelUp() {
        level += 1
        //レベルアップ時のエフェクトを何か追加
    }
    // 攻撃時ダメージ計算
    func attack(enemy: Character) -> String {
        enemy.hp -= ( strength - Int(arc4random_uniform(UInt32(strength / level))) ) // 計算適当
        enemy.hp = enemy.hp < 0 ? 0 : enemy.hp
        return "you"
    }
    //音声の出力
    func Sound(){
        
    }
    
    func startAnimation(imageView : UIImageView) {

        // 2秒かけて透明にし、完了したら2秒かけて元に戻す。
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       animations: { _ in
                        imageView.alpha = 0.0
        }, completion: { _ in UIView.animate(withDuration: 0.1,
                                             delay: 0.0,
                                             animations: { _ in
                                                imageView.alpha = 1.0
        }, completion: { _ in self.startAnimation(imageView: imageView) })})
    }
    
}
