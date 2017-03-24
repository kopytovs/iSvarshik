//
//  Cell.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

class Cell: UIViewController {
    
    //var page:Int = -1
    
    //var name = [""]
    
    var name: String?
    
    //var exp : [String : String] = ["": ""]

    var exp: String?
    
    @IBOutlet weak var text1: UILabel!
    
    @IBOutlet weak var explain: UITextView!
    
    @IBOutlet weak var form: UIImageView!
    
    @IBOutlet weak var formUNI: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contView: UIView!
    
    var image = UIImage()
    
    var choose = true
    
    override func viewDidLayoutSubviews() {
        /*let contentSize = self.explain.sizeThatFits(self.explain.bounds.size)
        var frame = self.explain.frame
        frame.size.height = contentSize.height
        self.explain.frame = frame
        let aspectRatioTextViewConstraint = NSLayoutConstraint(item: self.explain, attribute: .height, relatedBy: .equal, toItem: self.explain, attribute: .width, multiplier: explain.bounds.height/explain.bounds.width, constant: 1)
        self.explain.addConstraint(aspectRatioTextViewConstraint)*/
        
        /*let fixedWidth = explain.frame.size.width
        explain.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = explain.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = explain.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        explain.frame = newFrame;*/
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Name.text = Termin.mas[Termin.choose]
        
        //exp = exp1.sorted(by: { $0.0 < $1.0 })
        
        //print ("блаблабла: \(exp.count)")
        
        //self.explain.isScrollEnabled = false
        
        //self.explain.sizeToFit()
        
        /*let fixedWidth = explain.frame.size.width
        explain.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = explain.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = explain.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        explain.frame = newFrame*/
        
        textViewDidChange(textView: explain)
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgr2"))
        
        self.contView.backgroundColor = .clear
        
        text1.text = name! as String
        
        explain.text = exp! as String
        
        formUNI.isHidden = true
        
        /*UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
        
            self.tabBarController?.tabBar.layer.zPosition = -1
            
        }, completion: nil)*/
        
        switch name! {
            
        case "Погонная энергия El":
            
            formUNI.image = #imageLiteral(resourceName: "pogon")
            image = formUNI.image!
            formUNI.isHidden = false
            form.isHidden = true
            choose = false
            
            break
            
        case "Эффективный КПД процесса нагрева":
            
            formUNI.image = #imageLiteral(resourceName: "otnosh")
            image = formUNI.image!
            formUNI.isHidden = false
            form.isHidden = true
            choose = false
            break
            
        case "Плотность эффективной энергии Ql" :
            formUNI.image = #imageLiteral(resourceName: "plotnost")
            image = formUNI.image!
            formUNI.isHidden = false
            form.isHidden = true
            choose = false
            break
            
        case "Сварка взрывом" :
            form.image = #imageLiteral(resourceName: "i11")
            image = form.image!
            break
            
        case "Точечная контактная сварка":
            form.image = #imageLiteral(resourceName: "i20")
            image = form.image!
            break
            
        case "Шовная сварка внахлестку":
            form.image = #imageLiteral(resourceName: "i21")
            image = form.image!
            break
            
        case "Рельефная сварка":
            form.image = #imageLiteral(resourceName: "i25")
            image = form.image!
            break
            
        case "Стыковая сварка сопротивлением":
            form.image = #imageLiteral(resourceName: "i26")
            image = form.image!
            break
            
        case "Стыковая сварка оплавлением":
            form.image = #imageLiteral(resourceName: "i27")
            image = form.image!
            break
            
        case "Индукционная сварка":
            form.image = #imageLiteral(resourceName: "i29")
            image = form.image!
            break
            
        case "Сварка трением с перемешиванием":
            form.image = #imageLiteral(resourceName: "i34")
            image = form.image!
            break
            
        case "Диффузионная сварка":
            form.image = #imageLiteral(resourceName: "i31")
            image = form.image!
            break
            
        case "Термитная сварка":
            form.image = #imageLiteral(resourceName: "i35")
            image = form.image!
            break
            
        case "Лазерная сварка":
            form.image = #imageLiteral(resourceName: "i48")
            image = form.image!
            break
            
        case "Электрошлаковая сварка":
            form.image = #imageLiteral(resourceName: "i50")
            image = form.image!
            break
            
        case "Левый способ сварки":
            form.image = #imageLiteral(resourceName: "i52")
            image = form.image!
            break
            
        case "Правый способ сварки":
            form.image = #imageLiteral(resourceName: "i53")
            image = form.image!
            break
            
        case "Обратноступенчатая сварка":
            form.image = #imageLiteral(resourceName: "i54")
            image = form.image!
            break
            
        case "Сварка углом вперед":
            form.image = #imageLiteral(resourceName: "i55")
            image = form.image!
            break
            
        case "Сварка углом назад":
            form.image = #imageLiteral(resourceName: "i56")
            image = form.image!
            break
            
        case "Сварка с поперечным колебанием горелки":
            form.image = #imageLiteral(resourceName: "i57")
            image = form.image!
            break
            
        case "Наклон горелки":
            form.image = #imageLiteral(resourceName: "i59")
            image = form.image!
            break
            
        case "Угол между горелкой и изделием":
            form.image = #imageLiteral(resourceName: "i60")
            image = form.image!
            break
            
        case "Расстояние от мундштука до изделия":
            form.image = #imageLiteral(resourceName: "i61")
            image = form.image!
            break
            
        default :
            form.isHidden = true
            break
            
        }
        
        //self.form.layer.zPosition -= (self.view.frame.height+)
        
        //self.scrollView.updateConstraintsIfNeeded()
        
        //scrollView.sizeToFit()
        //contView.sizeToFit()
        //scrollView.updateConstraints()
        
        //self.explain.isScrollEnabled = true
        
        
        
        //if choose {
            //self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 600)
            
        //}
        
        //var frame: CGRect = scrollView.frame
        //frame.size = scrollView.contentSize
        //scrollView.frame = frame
        
        //exp = Array(exp1.keys).sorted(<)
        
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(textView: UITextView){
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareImage(_ sender: Any) {
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
        
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
