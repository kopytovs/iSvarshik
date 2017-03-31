//
//  SecondViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 11.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Term: UIButton!
    @IBOutlet weak var VideoLessons: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgr1"))
        // Do any additional setup after loading the view, typically from a nib.
        self.Term.layer.cornerRadius = self.Term.frame.size.width / 28
        self.Term.clipsToBounds = true
        
        self.VideoLessons.layer.cornerRadius = self.VideoLessons.frame.size.width / 28
        self.VideoLessons.clipsToBounds = true
        self.setStatusBarStyle(UIStatusBarStyle(rawValue: 1)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

