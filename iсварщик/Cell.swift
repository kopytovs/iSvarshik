//
//  Cell.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit
import ChameleonFramework
import ImageScrollView

class Cell: UIViewController {
    
    var name: String?

    var exp: String?
    
    @IBOutlet weak var text1: UILabel!
    
    @IBOutlet weak var explain: UITextView!
    
    @IBOutlet weak var imgView: ImageScrollView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contView: UIView!
    
    var image = UIImage()
    
    var choose = true
    
    let backr = UIColor(patternImage: #imageLiteral(resourceName: "backgr2"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = backr
        
        text1.text = name! as String
        
        explain.text = exp! as String
        
        contView.backgroundColor = UIColor.clear
        
        text1.textColor = ContrastColorOf(backr, returnFlat: true)
        explain.textColor = ContrastColorOf(backr, returnFlat: true)
        
        text1.sizeToFit()
        explain.sizeToFit()
        explain.updateConstraints()
        
        self.chooseImage()
        self.imgView.display(image: image)
        self.imgView.maximumZoomScale = 4.0
        self.imgView.zoomScale = 0.3
        
        self.navigationController?.hidesNavigationBarHairline = true
    }
    
    private func textViewDidChange(textView: UITextView){
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
    
    private func chooseImage(){
        switch name! {
            
        case "Погонная энергия El":
            
            image = #imageLiteral(resourceName: "pogon")
            choose = false
            break
            
        case "Эффективный КПД процесса нагрева":
            
            image = #imageLiteral(resourceName: "otnosh")
            choose = false
            break
            
        case "Плотность эффективной энергии Ql" :
            image = #imageLiteral(resourceName: "plotnost")
            choose = false
            break
            
        case "Сварка взрывом" :
            image = #imageLiteral(resourceName: "i11")
            break
            
        case "Точечная контактная сварка":
            image = #imageLiteral(resourceName: "i20")
            break
            
        case "Шовная сварка внахлестку":
            image = #imageLiteral(resourceName: "i21")
            
            break
            
        case "Рельефная сварка":
            image = #imageLiteral(resourceName: "i25")
            
            break
            
        case "Стыковая сварка сопротивлением":
            image = #imageLiteral(resourceName: "i26")
            
            break
            
        case "Стыковая сварка оплавлением":
            image = #imageLiteral(resourceName: "i27")
            
            break
            
        case "Индукционная сварка":
            image = #imageLiteral(resourceName: "i29")
            
            break
            
        case "Сварка трением с перемешиванием":
            image = #imageLiteral(resourceName: "i34")
            
            break
            
        case "Диффузионная сварка":
            image = #imageLiteral(resourceName: "i31")
            
            break
            
        case "Термитная сварка":
            image = #imageLiteral(resourceName: "i35")
            
            break
            
        case "Лазерная сварка":
            image = #imageLiteral(resourceName: "i48")
            
            break
            
        case "Электрошлаковая сварка":
            image = #imageLiteral(resourceName: "i50")
            
            break
            
        case "Левый способ сварки":
            image = #imageLiteral(resourceName: "i52")
            
            break
            
        case "Правый способ сварки":
            image = #imageLiteral(resourceName: "i53")
            
            break
            
        case "Обратноступенчатая сварка":
            image = #imageLiteral(resourceName: "i54")
            
            break
            
        case "Сварка углом вперед":
            image = #imageLiteral(resourceName: "i55")
            
            break
            
        case "Сварка углом назад":
            image = #imageLiteral(resourceName: "i56")
            
            break
            
        case "Сварка с поперечным колебанием горелки":
            image = #imageLiteral(resourceName: "i57")
            
            break
            
        case "Наклон горелки":
            image = #imageLiteral(resourceName: "i59")
            
            break
            
        case "Угол между горелкой и изделием":
            image = #imageLiteral(resourceName: "i60")
            
            break
            
        case "Расстояние от мундштука до изделия":
            image = #imageLiteral(resourceName: "i61")
            
            break
            
        default :
            image = #imageLiteral(resourceName: "пусто")
            break
            
        }
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
