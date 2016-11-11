//
//  CardsViewController.swift
//  CodePathTinder
//
//  Created by Bianca Curutan on 11/10/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var originalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            originalCenter = sender.view?.center
        } else if sender.state == .changed {
            sender.view?.center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
        } else if sender.state == .ended {
            
        }
        
        
    }
    


}

