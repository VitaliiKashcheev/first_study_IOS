//
//  Bird.swift
//  FlappyTennis
//
//  Created by Michael on 4/26/18.
//  Copyright © 2018 Mission Edition. All rights reserved.
//

import UIKit

class Bird: UIImageView {
    
    var rightSideX: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    var top:CGFloat{
        return self.frame.origin.y
    }
    
    var bottom:CGFloat{
        return self.frame.origin.y + self.frame.height
    }
    
    var leftSideX: CGFloat {
        return self.frame.origin.x
    }
    
    var direction: Direction = .right
    var movingDirTopToBottom:Direction = .top
    fileprivate var underhoodProperty: Double = 0.2
    
    static func addBird()-> Bird {
        
        let rect = CGRect(x: 100, y: 100, width: 50, height: 50)
        let bird = Bird(frame: rect)
        var images: [UIImage] = []
        for i in 1...3 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
        
        bird.animationImages = images
        bird.animationDuration = 0.5
        bird.animationRepeatCount = -1
        bird.contentMode = .scaleAspectFit
        bird.startAnimating()
        return bird
    }
    func add(to view: UIView) {
        view.addSubview(self)
    }


func move(){
    
let view = superview!

if direction == .right && rightSideX < view.frame.size.width{
    frame.origin.x += 1
    
    if rightSideX >= view.frame.size.width{
        direction = .left
    }
    
    transform = CGAffineTransform(scaleX: 1, y: 1)
    
    } else {
    frame.origin.x -= 1
    if leftSideX <= 0 {
        direction = .right
    }
    transform = CGAffineTransform(scaleX: -1, y: 1)
    
    
  
   
}
}

func moveUp() {
        
let view = superview!

if movingDirTopToBottom == .top && top > 0{
            frame.origin.y -= 1
        if top <= 0 {
            movingDirTopToBottom = .bottom
        }
        }else {
            frame.origin.y += 1
            if bottom >= view.frame.size.height{
                movingDirTopToBottom = .top
                
            }
        }
 
}
}




