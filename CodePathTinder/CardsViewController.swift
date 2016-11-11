//
//  CardsViewController.swift
//  CodePathTinder
//
//  Created by Bianca Curutan on 11/10/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {


    @IBOutlet weak var imageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapImageView(_ sender: UITapGestureRecognizer) {
        
        let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileVC.image = imageView.image
        self.present(profileVC, animated: true, completion: nil)
    }
    
    


}

