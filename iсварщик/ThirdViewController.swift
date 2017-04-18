//
//  ThirdViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit
import MessageUI
import ChameleonFramework
import JSSAlertView

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
            
            mail.view.tintColor = FlatOrange()
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    @IBAction func infoPush(_ sender: Any) {

        
        JSSAlertView().show(self, title: "Помощь", text: "Добро пожаловать в приложение iСварщик! Здесь вы можете рассчитать эквивалент углерода (С экв.), а также температуру предварительного подогрева для сварки сталей различных марок. Вы можете ввести значения содержания химических элементов состава стали или выбрать из перечня (перечень будет дополняться). Также приложение имеет глоссарий терминов, употребляемых в сварке (глоссарий постепенно будет дополняться новыми терминами), а также видеоуроки об особенностях технологии сварки различных материалов. За всеми вопросами обращаться в email, указанный ниже, либо звонить по телефону.", buttonText: "Спасибо!", color: UIColor(red:1.00, green:0.62, blue:0.36, alpha:1.0).flatten())
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
}
