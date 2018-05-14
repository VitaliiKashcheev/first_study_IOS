//
//  Rocket.swift
//  FlappyTennis
//
//  Created by Michael on 4/26/18.
//  Copyright © 2018 Mission Edition. All rights reserved.
//

import UIKit

class Rocket: UIImageView {
    
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
    
     var movingDirRocket: Direction = .top
    
    static func addRocket(to view: UIView) -> Rocket {
        let rect = CGRect(x: 0, y: 0, width: 20, height: 150)
        let rocket = Rocket(frame: rect)
        rocket.backgroundColor = .green
       /*var images: [UIImage] = []
        for i in 4...5 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
            rocket.animationImages = images
            rocket.animationDuration = 0.5
            rocket.animationRepeatCount = -1
            rocket.contentMode = .scaleAspectFit
            rocket.startAnimating()*/
            view.addSubview(rocket)
        return rocket
        
}
    func add(to view: UIView) {
        view.addSubview(self)
    }
    
    func rocketMove(){
        
        let view = superview!
        
        if movingDirRocket == .top && top>0{
            self.frame.origin.y -= 1
            if top<=0 {
                movingDirRocket = .bottom
            }
        }else{
            self.frame.origin.y += 1
            if bottom >= view.frame.size.height{
                movingDirRocket = .top
            }
        }
    }
}
