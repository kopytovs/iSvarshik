//
//  Cell.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

class Cell: UIViewController {
    
    var page:Int = -1
    
    var name = [""]
    
    @IBOutlet weak var text1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Name.text = Termin.mas[Termin.choose]
        
        text1.text = name[page] as String
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
