import UIKit

class RocketRight: UIImageView {
    
    var rightSideX: CGFloat {
        return self.frame.size.width - self.frame.width
        
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
    
    
    
    
    static func addRocket(to view: UIView) -> RocketRight {
        let rect = CGRect(x: view.frame.size.width - 20 , y: 150, width: 20, height: 150)
        let rocketRight = RocketRight(frame: rect)
        rocketRight.backgroundColor = .blue
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
        view.addSubview(rocketRight)
        return rocketRight
        
    }
}

