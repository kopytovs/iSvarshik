//
//  ThirdViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit
import MessageUI

class ThirdViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var callB: UIButton!
    @IBOutlet weak var mailB: UIButton!
    
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgr1"))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Call(_ sender: Any) {
        
        callB.isHighlighted = true
        if let url = URL(string: "tel://+78126772014") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: {(success) in print(success)
                })
            } else {
                let success = UIApplication.shared.openURL(url)
                print(success)
            }
        }
        callB.isHighlighted = false
    }
    
    @IBAction func send(_ sender: Any) {
        
        mailB.isHighlighted = true
        sendEmail()
        mailB.isHighlighted = false
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@se123.ru"])
            mail.setMessageBody("<p>Приветствую, Спецэлектрод-Сервис!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
}
