//
//  ViewController.swift
//  FlappyTennis
//
//  Created by Michael on 4/26/18.
//  Copyright © 2018 Mission Edition. All rights reserved.
//

import UIKit

// Changes for SMTH

enum Direction {
    case right
    case left
    case top
    case bottom
}

class ViewController: UIViewController {
  
  
    
    var bird: Bird!
    var timer: Timer!
    var sprite: Sprite!
    
    
    //for width
  
    
    
    //for rocket
    var rocket: Rocket!
   
    
    //for rocketR
    var rocketRight: RocketRight!
    var movingDirRocketR: Direction = .top
    
    /*override func viewDidLoad(){
        super.viewDidLoad()
        title = "Bird"
        navigationController?.viewControllers
        
    }*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for _ in 1...3{
        setupSceneSprite()
        }
        setupScene()
        runTimer()
        setupSceneRocket()
        
        }
    
    func setupScene() {
        bird = Bird.addBird()
        bird.add(to: view)
    }
    
    func setupSceneSprite(){
        sprite = Sprite.createSprite(to: view)
        }
    func setupSceneRocket(){
        rocket = Rocket.addRocket(to: view)
    }
        
        
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bird.direction = bird.direction == .right ? .left : .right
        
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
     rocket.movingDirRocket = rocket.movingDirRocket == .top ? .bottom : .top
        
    }

    
    func runTimer() {
        
        rocketRight = RocketRight.addRocket(to: view)
        timer = Timer.scheduledTimer(withTimeInterval: 0.007, repeats: true, block: { _ in
            
            self.timerTick()
            self.timerTickRocketR()
            self.kickRightRocketTop()
            self.kickRightRocketBottom()
        })
    }
    
  
    
    func timerTick() {
        bird.moveUp()
        bird.move()
        rocket.rocketMove()
    }
    
  
        
   
    
    //for rocketR
    
    func timerTickRocketR(){
        if movingDirRocketR == .top && rocket.top>0{
            rocketRight.frame.origin.y-=1
            if(rocketRight.top<=0) {
                movingDirRocketR = .bottom
            }
        }else{
            rocketRight.frame.origin.y+=1
            if(rocketRight.bottom>=view.frame.size.height){
                movingDirRocketR = .top
            }
        }
    }
    
    func kickRightRocketTop() {
        if bird.direction == .right && bird.rightSideX > rocketRight.leftSideX && bird.bottom > rocketRight.top && bird.top < rocketRight.bottom{
            bird.direction = .left
        }
        
        
     }
    func kickRightRocketBottom() {
        if bird.direction == .left && bird.leftSideX < rocket.rightSideX && bird.bottom > rocket.top && bird.top < rocket.bottom{
            bird.direction = .right
}
}

}


