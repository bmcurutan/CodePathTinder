//
//  DraggableImageView.swift
//  CodePathTinder
//
//  Created by Bianca Curutan on 11/10/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet var contentView: UIView!
    
    var originalCenter: CGPoint!
    
    var image: UIImage? {
        get { return customImageView.image }
        set { customImageView.image = newValue }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let defaultRotationAngle: CGFloat = 5
        let defaultRotationAngleInRadians = defaultRotationAngle.degreesToRadians
        
        let translation = sender.translation(in: self)
        let touchLocation = sender.location(in: self)
        
        if sender.state == .began {
            originalCenter = sender.view?.center
            
        } else if sender.state == .changed {
            
            if touchLocation.y <= originalCenter.y {
                let transform = CGAffineTransform(rotationAngle: CGFloat(defaultRotationAngleInRadians) * translation.x/100.0)
                self.transform = transform
                sender.view?.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
            } else {
                let transform = CGAffineTransform(rotationAngle: CGFloat(-defaultRotationAngleInRadians) * translation.x/100.0)
                self.transform = transform
                sender.view?.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
            }
        } else if sender.state == .ended {
            if translation.x > 100 {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.view?.center.x = 1000
                })
            } else if translation.x < -100 {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.view?.center.x = -1000
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    sender.view?.center = self.originalCenter
                    sender.view?.transform = .identity
                })
            }
        }
        
        
    }
    
    
    
    @IBAction func onRotationGesture(_ sender: UIRotationGestureRecognizer) {
        
    }
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
