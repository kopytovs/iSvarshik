//
//  FirstViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 11.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var C: UITextField!
    @IBOutlet weak var Si: UITextField!
    @IBOutlet weak var Mn: UITextField!
    @IBOutlet weak var Cr: UITextField!
    @IBOutlet weak var Mo: UITextField!
    @IBOutlet weak var Ni: UITextField!
    @IBOutlet weak var Cu: UITextField!
    @IBOutlet weak var V: UITextField!
    @IBOutlet weak var P: UITextField!
    @IBOutlet weak var diam: UITextField!
    
    //var numberOfEn = 0
    
    var fields = [ false, false, false ]
    
    @IBOutlet weak var cont: UISegmentedControl!
    //var arr1:NSarray = []
    
    let names = ["Сталь констр. углеродистая качественная", "Сталь констр. низколегированная для сварных конструкций"]
    
    let arr1 = ["|Пусто|", "05кп", "08", "08кп", "08пс", "08Фкп", "08Ю", "08ЮА", "10", "10кп", "10пс", "10ЮА", "11кп", "11ЮА", "12К", "15", "15К", "15кп", "15пс", "15ЮА", "16К", "18К", "18кп", "18ЮА", "20", "20-ПВ", "20А", "20К", "20кп", "20пс", "20ЮА", "22К", "25", "25пс", "30", "35", "40", "45", "50", "50А", "55", "58", "60", "ОсВ"]
    let arr4 = ["|Пусто|", "06Г2СЮ", "06ХГСЮ", "08Г2С", "08ГБЮ", "09Г2", "09Г2Д", "09Г2С", "09Г2СД", "09Г2ФБ", "09ГБЮ", "10Г2Б", "10Г2БД", "10Г2С1", "10Г2С1Д", "10Г2СБ", "10Г2СФБ ", "10Г2ФБ", "10Г2ФБЮ", "10ГС2", "10ГТ", "10Х2М1", "10ХГСН1Д", "10ХНДП", "10ХСНД", "12Г2Б", "12Г2С", "12Г2СБ", "12Г2СМФ", "12ГН2МФАЮ", "12ГС", "12ГСБ", "12ГФ-Ш", "12Х8", "12ХГН2МФБАЮ", "13Г1С-У", "13Г1СБ-У", " 13Г2АФ", "13ГС", "14Г2", "14Г2АФ", "14Г2АФД", "14ХГС", "15Г2АФД", "15Г2АФДпс", "15Г2СФ", "15Г2СФД", "15ГС", "15ГФ", "15ГФД", "15ХСНД", "16Г2АФ", "16Г2АФД", "16Г2САФ", "16Г2СФ", "16ГС", "16ГС-Ш", "16Д", "17Г1С", "17Г1С-У", "17ГС", "18Г2АФ", "18Г2АФД", "18Г2АФДпс", "18Г2АФпс", "18Г2С", "1Х2М1", "20ГС", "20ГС2", "20Х2Г2СР", "20ХГ2Т", "20ХГ2Ц", "20ХГС2", "22ГЮ", "22С", "22Х2Г2АЮ", "22Х2Г2Р", "23Х2Г2Т", "23Х2Г2Ц", "25Г2С", "25ГС", "25С2Р", "27ГС", "28С", "30ХС2", "32Г2Рпс", "35ГС", "6Г2АФ"]

    
    var choosen = 0
    
    @IBOutlet weak var picker: UIPickerView!
    //@IBOutlet var button: UIButton!
    
    @IBOutlet weak var rasch: UIButton!
    
    @IBOutlet weak var sekve: UITextView!
    @IBOutlet weak var tempa: UITextView!
    //@IBOutlet var sekve: UITextField!
    //@IBOutlet var tempa: UITextField!
    @IBOutlet weak var helper: UITextView!
    
    @IBOutlet weak var SiL: UILabel!
    @IBOutlet weak var PL: UILabel!
    var alpha: Bool = true
    var isClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //P.isHidden = true
        //Si.isHidden = true
        //PL.isHidden = true
        //SiL.isHidden = true
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgr1"))
        cont.tintColor = UIColor.orange
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.picker.dataSource = self
        self.picker.delegate = self
        self.sekve.layer.cornerRadius = self.sekve.frame.size.width / 16
        self.tempa.layer.cornerRadius = self.tempa.frame.size.width / 16
        self.rasch.layer.cornerRadius = self.rasch.frame.size.width / 16
        self.helper.layer.cornerRadius = self.helper.frame.size.width / 40
        self.rasch.clipsToBounds = true
        self.sekve.clipsToBounds = true
        self.tempa.clipsToBounds = true
        self.helper.clipsToBounds = true
        
        //let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        //self.view.addGestureRecognizer(longPressRecognizer)
        //longPressRecognizer.delegate = self
        
        /*if (UserDefaults.standard.value(forKey: "numberOfEn") != nil){
            numberOfEn = UserDefaults.standard.value(forKey: "numberOfEn") as! Int
        }
        
        numberOfEn += 1
        
        UserDefaults.standard.set(numberOfEn, forKey: "numberOfEn")*/
        
        //print ("итого: \(arr4.count)")
        
        //arr1 = ["alpha","beta","delta","gamma","koshka","sobaka"]
    } 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func longPressed(sender: UILongPressGestureRecognizer)
    {
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")

            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
        
    }*/
    @IBAction func longTap(_ sender: Any) {
        self.clearAll()
    }
    
    @IBAction func longTapOnHelper(_ sender: Any) {
        self.clearAll()
    }
    @IBAction func tapOnPicker(_ sender: Any) {
        self.dismissKeyboard()
    }
    
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return names.count
        } else{
            switch self.picker.selectedRow(inComponent: 0){
            case 0 :
                choosen = 0
                return arr1.count
            case 1:
                choosen = 1
                return arr4.count
            default:
                return 0
            }

        }
    }

    // returns width of column and height of row for each component.
    //func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat{
     //   return 100
    //}
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if component == 0{
            return 65
        } else{
            return 25
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return UIScreen.main.bounds.width * 5/8
        } else {
            return UIScreen.main.bounds.width * 1/4
        }
    }
    
    
    // these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
    // for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
    // If you return back a different object, the old one will be released. the view will be centered in the row rect
    /*func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "\(arr1[row])"
        if component == 0{
            return names[row]
        } else{
            switch self.picker.selectedRow(inComponent: 0){
            case 0:
                return arr1[row]
            case 1:
                return arr4[row]
            default:
                return "Ошибка!"
            }

        }
        
    }*/
    
    /*func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {// attributed title is favored if both methods are implemented{
        var attributedString: NSAttributedString!
        
        switch component {
        case 0:
            attributedString = NSAttributedString(string: arr1[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        case 1:
            attributedString = NSAttributedString(string: arr4[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        default:
            attributedString = nil
        }
        
        return attributedString
    }*/
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let nameText = UILabel()
        
        if component == 0{
            nameText.text = names[row]
            nameText.font.withSize(14)
        } else{
            
            nameText.font.withSize(33)
            
            switch self.picker.selectedRow(inComponent: 0){
            case 0:
                nameText.text = (arr1.count > row) ? arr1[row] : ""
            case 1:
                nameText.text = (arr4.count > row) ? arr4[row] : ""
            default:
                nameText.text = "Ошибка!"
            }
        }
        
        nameText.textAlignment = NSTextAlignment.center
        
        nameText.numberOfLines = 0
        
        nameText.textColor = UIColor.white
        
        //nameText.tintColor = UIColor.orange
        
        //nameText.layer.borderWidth = 1
        
        //nameText.layer.borderColor = UIColor.orange.cgColor
        
        pickerView.subviews[1].backgroundColor = UIColor.orange
        pickerView.subviews[2].backgroundColor = UIColor.orange
        
       // self.picker.reloadAllComponents()
        
        return nameText
        
    }
    
    /*func mark (_ C1: Double, Mn1: Double, Cr1: Double, Mo1: Double, Ni1: Double, Cu1: Double, V1: Double)
    {
        C.text = String(C1)
        Mn.text = String(Mn1)
        Cr.text = String(Cr1)
        Mo.text = String(Mo1)
        Ni.text = String(Ni1)
        Cu.text = String(Cu1)
        V.text = String(V1)

    }*/
    
    func mark (_ C1: Double, Si1: Double, Mn1: Double, Cr1: Double, Mo1: Double, Ni1: Double, Cu1: Double, V1: Double, P1: Double){
    //func mark2 (_ C1: Double, Si1: Double, Mn1: Double, Cr1: Double, Ni1: Double, Cu1: Double, V1: Double, P1: Double){
        
        C.text = String(C1)
        Si.text = String(Si1)
        Mn.text = String(Mn1)
        Cr.text = String(Cr1)
        Mo.text = String(Mo1)
        Ni.text = String(Ni1)
        Cu.text = String(Cu1)
        V.text = String(V1)
        P.text = String(P1)
        
    }
    
    func clearAll () {
        C.text?.removeAll()
        Si.text?.removeAll()
        Mn.text?.removeAll()
        Cr.text?.removeAll()
        Mo.text?.removeAll()
        Ni.text?.removeAll()
        Cu.text?.removeAll()
        V.text?.removeAll()
        P.text?.removeAll()
        diam.text?.removeAll()
        sekve.text = "0"
        tempa.text = "0"
        isClear = false
        self.picker.selectRow(0, inComponent: 1, animated: true)
        self.picker.selectRow(0, inComponent: 0, animated: true)
        isClear = true
        self.picker.reloadAllComponents()
        //sekve.text.removeAll()
        //tempa.text.removeAll()
    }
    
    func clearFields () {
        C.text?.removeAll()
        Si.text?.removeAll()
        Mn.text?.removeAll()
        Cr.text?.removeAll()
        Mo.text?.removeAll()
        Ni.text?.removeAll()
        Cu.text?.removeAll()
        V.text?.removeAll()
        P.text?.removeAll()
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        if component == 0 {
            self.picker.reloadComponent(1)
        }
        if component == 1{
            if choosen == 0 {
            switch row {
        case 0:
            self.clearFields()
            //mark(0,Mn1: 0,Cr1: 0,Mo1: 0,Ni1: 0,Cu1: 0,V1: 0)
            break
            
        case 1:
            mark(0.06, Si1: 0, Mn1: 0.4, Cr1: 0.1, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0)
            break
            
        case 2:
            mark(0.12,Si1: 0,Mn1: 0.65,Cr1: 0.1,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 3:
            mark(0.12,Si1: 0,Mn1: 0.5,Cr1: 0.1,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
        
        case 4:
            mark(0.11,Si1: 0,Mn1: 0.65,Cr1: 0.1,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 5:
            mark(0.08,Si1: 0,Mn1: 0.4,Cr1: 0.03,Mo1: 0,Ni1: 0.01,Cu1: 0.01,V1: 0.04, P1: 0)
            break
            
        case 6:
            mark(0.07,Si1: 0,Mn1: 0.35,Cr1: 0,Mo1: 0,Ni1: 0,Cu1: 0,V1: 0, P1: 0)
            break
            
        case 7:
            mark(0.1,Si1: 0,Mn1: 0.4,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 8:
            mark(0.14,Si1: 0,Mn1: 0.65,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 9:
            mark(0.14,Si1: 0,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 10:
            mark(0.14,Si1: 0,Mn1: 0.65,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 11:
            mark(0.14,Si1: 0,Mn1: 0.4,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 12:
            mark(0.12,Si1: 0,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 13:
            mark(0.13,Si1: 0,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.25,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 14:
            mark(0.16,Si1: 0,Mn1: 0.7,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 15:
            mark(0.19,Si1: 0,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 16:
            mark(0.2,Si1: 0,Mn1: 0.65,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 17:
            mark(0.19,Si1: 0,Mn1: 0.5,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 18:
            mark(0.19,Si1: 0,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 19:
            mark(0.18,Si1: 0,Mn1: 0.45,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 20:
            mark(0.2,Si1: 0,Mn1: 0.75,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 21:
            mark(0.22,Si1: 0,Mn1: 0.85,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 22:
            mark(0.2,Si1: 0,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 23:
            mark(0.22,Si1: 0,Mn1: 0.4,Cr1: 0.15,Mo1: 0,Ni1: 0.25,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 24:
            mark(0.24,Si1: 0,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 25:
            mark(0.24,Si1: 0,Mn1: 0.65,Cr1: 0.15,Mo1: 0,Ni1: 0.15,Cu1: 0.15,V1: 0, P1: 0)
            break
            
        case 26:
            mark(0.24,Si1: 0,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.25,Cu1: 0,V1: 0, P1: 0)
            break
            
        case 27:
            mark(0.24,Si1: 0,Mn1: 0.65,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 28:
            mark(0.24,Si1: 0,Mn1: 0.5,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 29:
            mark(0.24,Si1: 0,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 30:
            mark(0.22,Si1: 0,Mn1: 0.45,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0, P1: 0)
            break
            
        case 31:
            mark(0.26,Si1: 0,Mn1: 1,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 32:
            mark(0.3,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 33:
            mark(0.27,Si1: 0,Mn1: 0.5,Cr1: 0.25,Mo1: 0,Ni1: 0.25,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 34:
            mark(0.35,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 35:
            mark(0.4,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 36:
            mark(0.45,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 37:
            mark(0.5,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 38:
            mark(0.55,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 39:
            mark(0.55,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 40:
            mark(0.5,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 41:
            mark(0.63,Si1: 0,Mn1: 0.2,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 42:
            mark(0.65,Si1: 0,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0, P1: 0)
            break
            
        case 43:
            mark(0.48,Si1: 0,Mn1: 0.85,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.25,V1: 0, P1: 0)
            break
            
        default:
            break
                }
            } else if choosen == 1{
                //doing of 4rd group
                switch row{
                    
                case 0:
                    self.clearFields()
                    //mark(0,Si1: 0,Mn1: 0,Cr1: 0,Mo1: 0,Ni1: 0,Cu1: 0,V1: 0,P1: 0)
                    
                case 1: mark(0.08, Si1: 0.6, Mn1: 1.7, Cr1: 0, Mo1: 0, Ni1: 0, Cu1: 0, V1: 0, P1: 0)
                    
                case 2: mark(0.09, Si1: 0.6, Mn1: 1.4, Cr1: 0.6, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.03)
                    
                case 3: mark(0.15, Si1: 1.0, Mn1: 2.3, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.03)
                    
                case 4: mark(0.1, Si1: 0.3, Mn1: 1.4, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 5: mark(0.12, Si1: 0.37, Mn1: 1.8, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 6: mark(0.12, Si1: 0.37, Mn1: 1.8, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 7: mark(0.12, Si1: 0.8, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 8: mark(0.12, Si1: 0.8, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 9: mark(0.13, Si1: 0.35, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.09, P1: 0.02)
                    
                case 10: mark(0.11, Si1: 0.3, Mn1: 1.4, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 11: mark(0.12, Si1: 0.37, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 12: mark(0.12, Si1: 0.37, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 13: mark(0.12, Si1: 1.1, Mn1: 1.65, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 14: mark(0.12, Si1: 1.1, Mn1: 1.65, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 15: mark(0.13, Si1: 0.5, Mn1: 1.8, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 16: mark(0.13, Si1: 0.5, Mn1: 1.8, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.1, P1: 0.025)
                    
                case 17: mark(0.12, Si1: 0.35, Mn1: 1.75, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.12, P1: 0.02)
                    
                case 18: mark(0.12, Si1: 0.35, Mn1: 1.75, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.12, P1: 0.02)
                    
                case 19: mark(0.14, Si1: 2.1, Mn1: 1.5, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 20: mark(0.13, Si1: 0.65, Mn1: 1.4, Cr1: 0.3, Mo1: 0, Ni1: 0, Cu1: 0.3, V1: 0, P1: 0.03)
                    
                case 21: mark(0.12, Si1: 0.37, Mn1: 0.6, Cr1: 2.5, Mo1: 1.1, Ni1: 0.5, Cu1: 0, V1: 0, P1: 0.03)
                    
                case 22: mark(0.12, Si1: 1, Mn1: 0.9, Cr1: 0.7, Mo1: 0, Ni1: 1.6, Cu1: 0.6, V1: 0, P1: 0.035)
                    
                case 23: mark(0.12, Si1: 0.37, Mn1: 0.6, Cr1: 0.8, Mo1: 0, Ni1: 0.6, Cu1: 0.5, V1: 0, P1: 0.12)
                    
                case 24: mark(0.12, Si1: 1.1, Mn1: 0.8, Cr1: 0.9, Mo1: 0, Ni1: 0.8, Cu1: 0.6, V1: 0, P1: 0.035)
                    
                case 25: mark(0.16, Si1: 0.37, Mn1: 1.65, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 26: mark(0.15, Si1: 0.6, Mn1: 1.65, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 27: mark(0.14, Si1: 0.5, Mn1: 1.75, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 28: mark(0.15, Si1: 0.7, Mn1: 1.7, Cr1: 0.3, Mo1: 0.25, Ni1: 0.3, Cu1: 0.03, V1: 0.15, P1: 0.035)
                    
                case 29: mark(0.16, Si1: 0.6, Mn1: 1.3, Cr1: 0.5, Mo1: 0.25, Ni1: 1.7, Cu1: 0.03, V1: 0.1, P1: 0.035)
                    
                case 30: mark(0.15, Si1: 0.8, Mn1: 1.2, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 31: mark(0.14, Si1: 0.5, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 32: mark(0.14, Si1: 0.37, Mn1: 1, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.4, V1: 0.08, P1: 0.02)
                    
                case 33: mark(0.12, Si1: 0.37, Mn1: 0.6, Cr1: 9, Mo1: 0, Ni1: 0.4, Cu1: 0.25, V1: 0, P1: 0.035)
                    
                case 34: mark(0.16, Si1: 0.5, Mn1: 1.3, Cr1: 0.9, Mo1: 0.4, Ni1: 1.7, Cu1: 0, V1: 0.1, P1: 0.035)
                    
                case 35: mark(0.15, Si1: 0.6, Mn1: 1.55, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 36: mark(0.15, Si1: 0.6, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 37: mark(0.18, Si1: 0.5, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.11, P1: 0.03)
                    
                case 38: mark(0.15, Si1: 0.6, Mn1: 1.45, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 39: mark(0.18, Si1: 0.37, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 40: mark(0.18, Si1: 0.6, Mn1: 1.6, Cr1: 0.4, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.12, P1: 0.035)
                    
                case 41: mark(0.18, Si1: 0.6, Mn1: 1.6, Cr1: 0.4, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.12, P1: 0.035)
                    
                case 42: mark(0.16, Si1: 0.7, Mn1: 1.3, Cr1: 0.8, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 43: mark(0.18, Si1: 0.17, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.4, V1: 0.15, P1: 0.035)
                    
                case 44: mark(0.18, Si1: 0.17, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.4, V1: 0.15, P1: 0.035)
                    
                case 45: mark(0.18, Si1: 0.7, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.4, V1: 0.1, P1: 0.035)
                    
                case 46: mark(0.18, Si1: 0.7, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.1, P1: 0.035)
                    
                case 47: mark(0.18, Si1: 1, Mn1: 1.3, Cr1: 0.3, Mo1: 0.15, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 48: mark(0.18, Si1: 0.37, Mn1: 1.2, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.4, V1: 0.12, P1: 0.035)
                    
                case 49: mark(0.18, Si1: 0.37, Mn1: 1.2, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.12, P1: 0.035)
                    
                case 50: mark(0.18, Si1: 0.7, Mn1: 0.7, Cr1: 0.9, Mo1: 0, Ni1: 0.6, Cu1: 0.4, V1: 0, P1: 0.035)
                    
                case 51: mark(0.2, Si1: 0.6, Mn1: 1.7, Cr1: 0.4, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.14, P1: 0.035)
                    
                case 52: mark(0.2, Si1: 0.6, Mn1: 1.7, Cr1: 0.4, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.14, P1: 0.035)
                    
                case 53: mark(0.2, Si1: 0.5, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0, Cu1: 0, V1: 0.12, P1: 0.025)
                    
                case 54: mark(0.19, Si1: 0.6, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.1, P1: 0.035)
                    
                case 55: mark(0.18, Si1: 0.7, Mn1: 1.2, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 56: mark(0.18, Si1: 0.7, Mn1: 1.2, Cr1: 0.3, Mo1: 0.15, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 57: mark(0.18, Si1: 0.25, Mn1: 0.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.35, V1: 0, P1: 0.035)
                    
                case 58: mark(0.2, Si1: 0.6, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 59: mark(0.2, Si1: 0.6, Mn1: 1.55, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.025)
                    
                case 60: mark(0.2, Si1: 0.6, Mn1: 1.4, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 61: mark(0.22, Si1: 0.17, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 62: mark(0.22, Si1: 0.17, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 63: mark(0.22, Si1: 0.17, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 64: mark(0.22, Si1: 0.17, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 65: mark(0.23, Si1: 0.9, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 66: mark(0.13, Si1: 0.37, Mn1: 0.6, Cr1: 2.5, Mo1: 1.1, Ni1: 0.5, Cu1: 0.3, V1: 0, P1: 0.035)
                    
                case 67: mark(0.22, Si1: 1.5, Mn1: 1.5, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 68: mark(0.22, Si1: 2.4, Mn1: 1.5, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 69: mark(0.26, Si1: 1.55, Mn1: 1.8, Cr1: 1.8, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 70: mark(0.26, Si1: 0.7, Mn1: 1.9, Cr1: 1.7, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 71: mark(0.26, Si1: 0.7, Mn1: 1.9, Cr1: 1.2, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 72: mark(0.22, Si1: 2.4, Mn1: 1.5, Cr1: 1.2, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 73: mark(0.22, Si1: 0.3, Mn1: 1.4, Cr1: 0.4, Mo1: 0, Ni1: 0, Cu1: 0, V1: 0, P1: 0)
                    
                case 74: mark(0.25, Si1: 1.2, Mn1: 0.9, Cr1: 0, Mo1: 0, Ni1: 0, Cu1: 0, V1: 0, P1: 0.04)
                    
                case 75: mark(0.26, Si1: 0.7, Mn1: 1.7, Cr1: 2.1, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 76: mark(0.26, Si1: 0.7, Mn1: 1.9, Cr1: 1.9, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 77: mark(0.26, Si1: 0.7, Mn1: 1.7, Cr1: 1.7, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 78: mark(0.26, Si1: 0.7, Mn1: 1.7, Cr1: 1.7, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 79: mark(0.29, Si1: 0.9, Mn1: 1.6, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 80: mark(0.26, Si1: 0.9, Mn1: 1.3, Cr1: 0.8, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 81: mark(0.29, Si1: 1.7, Mn1: 0.9, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 82: mark(0.3, Si1: 1.5, Mn1: 1.3, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 83: mark(0.32, Si1: 1.2, Mn1: 0.9, Cr1: 0, Mo1: 0, Ni1: 0, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 84: mark(0.32, Si1: 2.2, Mn1: 0.9, Cr1: 0.9, Mo1: 0, Ni1: 0, Cu1: 0, V1: 0, P1: 0.04)
                    
                case 85: mark(0.37, Si1: 0.17, Mn1: 1.75, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.045)
                    
                case 86: mark(0.37, Si1: 0.9, Mn1: 1.7, Cr1: 0.3, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0, P1: 0.04)
                    
                case 87: mark(0.2, Si1: 0.6, Mn1: 1.7, Cr1: 0.4, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.14, P1: 0.035)
                    
               // case 88: mark2(0.2, Si1: 0.6, Mn1: 1.7, Cr1: 0.4, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0.14, P1: 0.035)
                default:
                    break


                }
                //P.text = nil
                //Si.text = nil
            }
        }
        
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func controlY(_ sender: UISegmentedControl) {
        
        switch cont.selectedSegmentIndex
        {
        case 0:
            
            alpha = true
            //P.isHidden = true
            //Si.isHidden = true
            //PL.isHidden = true
            //SiL.isHidden = true
            break
        
            
        case 1:
            
            alpha = false
            //P.isHidden = false
            //Si.isHidden = false
            //PL.isHidden = false
            //SiL.isHidden = false
            break
            
        default:
            break; 
        }
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationController = segue.destination as! ThirdViewController
        
        destinationController.num = numberOfEn


    }*/
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "," {
            textField.text! += "."
            return false
        }
        
        let dotsCount = textField.text?.components(separatedBy: ".").count
        if dotsCount! > 0 && string == "." {
            textField.text!.remove(at: (textField.text?.endIndex)!)
            return false
        }
        
        return true
    }
    
    
    @IBAction func calc (_ sender : AnyObject){
        
        if !(diam.text?.isEmpty)! {
            helper.text = "Подсказки: чтобы очистить поля - удерживайте палец на свободной зоне"
        }
        
        if !(C.text?.isEmpty)! && !(Mn.text?.isEmpty)! && !(Cr.text?.isEmpty)! && !(Mo.text?.isEmpty)! && !(Ni.text?.isEmpty)! && !(Cu.text?.isEmpty)! && !(V.text?.isEmpty)! {
            
            fields[0] = true
            
        } else{
            fields[0] = false
        }
        
        if !(C.text?.isEmpty)! && !(Mn.text?.isEmpty)! && !(Cr.text?.isEmpty)! && !(Ni.text?.isEmpty)! && !(Cu.text?.isEmpty)! && !(V.text?.isEmpty)! && !(P.text?.isEmpty)! && !(Si.text?.isEmpty)! {
            
            fields[1] = true
            
        } else{
            
            fields[1] = false
            
        }
        
        if (diam.text?.isEmpty)! {
            
            fields[2] = false
            
        } else{
            fields[2] = true
        }
        
        var Temp : Double
        var Cekv : Double
        
        let real = true
        
        if alpha {
            
            if fields[0] {
                
                /*if !(P.text?.isEmpty)! || !(Si.text?.isEmpty)! {
                    
                    let alert = UIAlertController(title: "Ошибка", message: "В данной формуле недопустимо применение сторонних хим. элементов! Очистить лишние ячейки?", preferredStyle: .alert)
                    
                    let cancel = UIAlertAction(title: "Отменить", style: .default, handler: {(alert) -> Void in
                        
                        real = false
                    
                    })
                    
                    let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
                    
                        self.P.text?.removeAll()
                        self.Si.text?.removeAll()
                    
                    })
                    
                    alert.addAction(cancel)
                    
                    alert.addAction(ok)
                    
                    present(alert, animated: true, completion: nil)
                    
                }*/
                
                Cekv = cekv(Double(C.text!)!, Mn: Double(Mn.text!)!, Cr: Double(Cr.text!)!, Mo: Double(Mo.text!)!, Ni: Double(Ni.text!)!, Cu: Double(Cu.text!)!, V: Double(V.text!)!)
                
                if real {
                    sekve.text = "\(Double(Cekv).roundTo(places: 3))"
                }
                
                
                if fields[2] {
                    
                    Temp = temp(Double(diam.text!)!, cek: Cekv)
                    
                    //print ("Вот Нан или не Нан: |\(Temp)|")
                        
                    if Temp.isNaN {
                            
                            let alert4 = UIAlertController(title: "Ошибка", message: "Диаметр слишком мал!", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alert4.addAction(ok)
                            present(alert4, animated: true, completion: nil)
                            
                        } else{
                            
                            tempa.text = "\(Double(Temp).roundTo(places: 3))"
                        }
                        
                    } else{
                    
                        helper.text = "Невозможно расчитать температуру без диаметра!"
                    
                    }
                
            } else {
                
                var mas = [String]()
                
                if (C.text?.isEmpty)! {mas.append("C")}
                if (Mn.text?.isEmpty)! {mas.append("Mn")}
                if (Cr.text?.isEmpty)! {mas.append("Cr")}
                if (Mo.text?.isEmpty)! {mas.append("Mo")}
                if (Ni.text?.isEmpty)! {mas.append("Ni")}
                if (Cu.text?.isEmpty)! {mas.append("Cu")}
                if (V.text?.isEmpty)! {mas.append("V")}
                
                let alert1 = UIAlertController(title: "Ошибка", message: "Обнаружены пустые ячейки! Пожалуйста, введите информацию в ячейки: \n\(mas)", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert1.addAction(ok)
                
                present(alert1, animated: true, completion: nil)
                
            }
            
        } else{
            
            if fields[1] {
                
                //Cekv = cekv_gost(Double(C.text!)!, Si: Double(Si.text!)!, Mn: Double(Mn.text!)!, Cr: Double(Cr.text!)!, Mo: Double(Mo.text!)!, Ni: Double(Ni.text!)!, Cu: Double(Cu.text!)!, V: Double(V.text!)!, P: Double(P.text!)! )
                Cekv = cekv_gost(Double(C.text!)!, Si: Double(Si.text!)!, Mn: Double(Mn.text!)!, Cr: Double(Cr.text!)!, Ni: Double(Ni.text!)!, Cu: Double(Cu.text!)!, V: Double(V.text!)!, P: Double(P.text!)! )

                sekve.text = "\(Double(Cekv).roundTo(places: 3))"
                
                if fields[2] {
                    
                    Temp = temp(Double(diam.text!)!, cek: Cekv)
                    
                    if Temp.isNaN {
                        
                        let alert3 = UIAlertController(title: "Ошибка", message: "Диаметр слишком мал!", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert3.addAction(ok)
                        present(alert3, animated: true, completion: nil)
                        
                    } else{
                    
                        tempa.text = "\(Double(Temp).roundTo(places: 3))"
                        
                    }
                    
                } else{
                    
                    helper.text = "Невозможно расчитать температуру без диаметра!"
                    
                }
                
            } else{
                
                var mas1 = [String]()
                
                if (C.text?.isEmpty)! {mas1.append("C")}
                if (Mn.text?.isEmpty)! {mas1.append("Mn")}
                if (Cr.text?.isEmpty)! {mas1.append("Cr")}
                //if (Mo.text?.isEmpty)! {mas1.append("Mo")}
                if (Ni.text?.isEmpty)! {mas1.append("Ni")}
                if (Cu.text?.isEmpty)! {mas1.append("Cu")}
                if (V.text?.isEmpty)! {mas1.append("V")}
                if (Si.text?.isEmpty)! {mas1.append("Si")}
                if (P.text?.isEmpty)! {mas1.append("P")}
                
                let alert2 = UIAlertController(title: "Ошибка", message: "Обнаружены пустые ячейки! Пожалуйста, введите информацию в ячейки: \n\(mas1)", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert2.addAction(ok)
                
                present(alert2, animated: true, completion: nil)
                
            }
            
        }
        
        
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }

}


func cekv (_ C: Double, Mn: Double, Cr: Double, Mo: Double, Ni: Double, Cu: Double, V: Double) -> Double {
    
    return C+Mn/6+Cr/5+Mo/5+Ni/15+Cu/15+V/5
    
}

func temp (_ diam: Double, cek: Double) -> Double {
    
    return 350*sqrt(cek*(1+0.005*diam)-0.25)
    
}


func cekv_gost (_ C: Double, Si: Double, Mn: Double, Cr: Double, Ni: Double, Cu: Double, V: Double, P: Double) -> Double {

    return C+Si/24+Mn/6+Cr/5+Ni/40+Cu/13+V/14+P/2
    
}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
