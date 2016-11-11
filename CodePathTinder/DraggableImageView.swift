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
        
        let translation = sender.translation(in: self)
        
        
        if sender.state == .began {
            originalCenter = sender.view?.center
        } else if sender.state == .changed {
            sender.view?.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
        } else if sender.state == .ended {
            
        }
        
        
    }
    
    func convert
}
