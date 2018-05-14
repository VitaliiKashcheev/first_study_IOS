//
//  Sprite.swift
//  FlappyTennis
//
//  Created by Michael on 4/26/18.
//  Copyright © 2018 Mission Edition. All rights reserved.
//

import UIKit

class Sprite: UIImageView {
    
    var rightSideX: CGFloat {
        return self.frame.origin.x +
            self.frame.size.width
    }
    
    var top:CGFloat{
        return self.frame.origin.y
    }
    
    var bottom:CGFloat{
        return self.frame.origin.y +
            
            self.frame.height
    }
    
    var leftSideX: CGFloat {
        return self.frame.origin.x
    }
    
    static func createSprite(to view: UIView)-> Sprite {
        let x: CGFloat = CGFloat(arc4random_uniform(UInt32 (view.frame.size.width)))
        let y: CGFloat = CGFloat(arc4random_uniform(UInt32(view.frame.size.height)))
        let rect = CGRect(x: x, y: y, width: 30, height: 30)
        let sprite = Sprite(frame: rect)
        sprite.backgroundColor = .yellow
        /*let image = UIImage(named: "\(i)")!
         images.append(image)
         
         rocket.animationImages = images
         rocket.animationDuration = 0.5
         rocket.animationRepeatCount = -1
         rocket.contentMode = .scaleAspectFit
         rocket.startAnimating()*/
        view.addSubview(sprite)
        return sprite
        
    }
    
    func add(to view: UIView) {
        view.addSubview(self)
    }
    
}
