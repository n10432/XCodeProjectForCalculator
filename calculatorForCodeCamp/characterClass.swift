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
    var level: Int
    //HP
    var hp: Int
    //対応するイメージビュー
    var imageView: UIImageView!
    //画像
    var image: UIImage!
        
    // イニシャライザ
    init(level: Int = 1, image: String = "mon_191.gif", imageView: UIImageView) {
        self.level = level
        self.hp = 100 * level
        self.image = UIImage(named : image)!
        self.imageView = imageView
        self.imageView.image = self.image
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
    
    // レベルUP メソッド
    func levelUp() {
        level += 1
        //レベルアップ時のエフェクトを何か追加
    }
    // 攻撃時のエフェクトとか点滅動作
    func atack(enemy: Character) -> String {
        return "a"
    }
}
