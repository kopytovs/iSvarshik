//
//  FirstViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 11.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var C: UITextField!
    @IBOutlet weak var Si: UITextField!
    @IBOutlet var Mn: UITextField!
    @IBOutlet var Cr: UITextField!
    @IBOutlet var Mo: UITextField!
    @IBOutlet var Ni: UITextField!
    @IBOutlet var Cu: UITextField!
    @IBOutlet var V: UITextField!
    @IBOutlet weak var P: UITextField!
    @IBOutlet var diam: UITextField!
    
    @IBOutlet weak var cont: UISegmentedControl!
    //var arr:NSArray = []
    let arr = ["|Пусто|", "05кп", "08", "08кп", "08пс", "08Фкп", "08Ю", "08ЮА", "10", "10кп", "10пс", "10ЮА", "11кп", "11ЮА", "12К", "15", "15К", "15кп", "15пс", "15ЮА", "16К", "18К", "18кп", "18ЮА", "20", "20-ПВ", "20А", "20К", "20кп", "20пс", "20ЮА", "22К", "25", "25пс", "30", "35", "40", "45", "50", "50А", "55", "58", "60", "ОсВ"]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        P.isHidden = true
        Si.isHidden = true
        PL.isHidden = true
        SiL.isHidden = true
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
        //arr = ["alpha","beta","delta","gamma","koshka","sobaka"]
    } 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }

    // returns width of column and height of row for each component.
    //func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat{
    //}
    
    //func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    //}
    
    
    // these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
    // for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
    // If you return back a different object, the old one will be released. the view will be centered in the row rect
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "\(arr[row])"
        return arr[row]
    }
    
    //func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? // attributed title is favored if both methods are implemented{
        
    //}
    
    
    //func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    //}
    
    func mark (_ C1: Double, Mn1: Double, Cr1: Double, Mo1: Double, Ni1: Double, Cu1: Double, V1: Double)
    {
        C.text = String(C1)
        Mn.text = String(Mn1)
        Cr.text = String(Cr1)
        Mo.text = String(Mo1)
        Ni.text = String(Ni1)
        Cu.text = String(Cu1)
        V.text = String(V1)

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        switch row {
        case 0:
            mark(0,Mn1: 0,Cr1: 0,Mo1: 0,Ni1: 0,Cu1: 0,V1: 0)
            break
            
        case 1:
            mark(0.06, Mn1: 0.4, Cr1: 0.1, Mo1: 0, Ni1: 0.3, Cu1: 0.3, V1: 0)
            break
            
        case 2:
            mark(0.12,Mn1: 0.65,Cr1: 0.1,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 3:
            mark(0.12,Mn1: 0.5,Cr1: 0.1,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
        
        case 4:
            mark(0.11,Mn1: 0.65,Cr1: 0.1,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 5:
            mark(0.08,Mn1: 0.4,Cr1: 0.03,Mo1: 0,Ni1: 0.01,Cu1: 0.01,V1: 0.04)
            break
            
        case 6:
            mark(0.07,Mn1: 0.35,Cr1: 0,Mo1: 0,Ni1: 0,Cu1: 0,V1: 0)
            break
            
        case 7:
            mark(0.1,Mn1: 0.4,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0)
            break
            
        case 8:
            mark(0.14,Mn1: 0.65,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 9:
            mark(0.14,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 10:
            mark(0.14,Mn1: 0.65,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 11:
            mark(0.14,Mn1: 0.4,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0)
            break
            
        case 12:
            mark(0.12,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.2,V1: 0)
            break
            
        case 13:
            mark(0.13,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.25,Cu1: 0.2,V1: 0)
            break
            
        case 14:
            mark(0.16,Mn1: 0.7,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 15:
            mark(0.19,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 16:
            mark(0.2,Mn1: 0.65,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 17:
            mark(0.19,Mn1: 0.5,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 18:
            mark(0.19,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 19:
            mark(0.18,Mn1: 0.45,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0)
            break
            
        case 20:
            mark(0.2,Mn1: 0.75,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 21:
            mark(0.22,Mn1: 0.85,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 22:
            mark(0.2,Mn1: 0.5,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.2,V1: 0)
            break
            
        case 23:
            mark(0.22,Mn1: 0.4,Cr1: 0.15,Mo1: 0,Ni1: 0.25,Cu1: 0.2,V1: 0)
            break
            
        case 24:
            mark(0.24,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 25:
            mark(0.24,Mn1: 0.65,Cr1: 0.15,Mo1: 0,Ni1: 0.15,Cu1: 0.15,V1: 0)
            break
            
        case 26:
            mark(0.24,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.25,Cu1: 0,V1: 0)
            break
            
        case 27:
            mark(0.24,Mn1: 0.65,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 28:
            mark(0.24,Mn1: 0.5,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 29:
            mark(0.24,Mn1: 0.65,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 30:
            mark(0.22,Mn1: 0.45,Cr1: 0.1,Mo1: 0,Ni1: 0.15,Cu1: 0.2,V1: 0)
            break
            
        case 31:
            mark(0.26,Mn1: 1,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 32:
            mark(0.3,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 33:
            mark(0.27,Mn1: 0.5,Cr1: 0.25,Mo1: 0,Ni1: 0.25,Cu1: 0.3,V1: 0)
            break
            
        case 34:
            mark(0.35,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 35:
            mark(0.4,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 36:
            mark(0.45,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 37:
            mark(0.5,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 38:
            mark(0.55,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 39:
            mark(0.55,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 40:
            mark(0.5,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 41:
            mark(0.63,Mn1: 0.2,Cr1: 0.15,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 42:
            mark(0.65,Mn1: 0.8,Cr1: 0.25,Mo1: 0,Ni1: 0.3,Cu1: 0.3,V1: 0)
            break
            
        case 43:
            mark(0.48,Mn1: 0.85,Cr1: 0.3,Mo1: 0,Ni1: 0.3,Cu1: 0.25,V1: 0)
            break
            
        default:
            break
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
            P.isHidden = true
            Si.isHidden = true
            PL.isHidden = true
            SiL.isHidden = true
            break
        
            
        case 1:
            
            alpha = false
            P.isHidden = false
            Si.isHidden = false
            PL.isHidden = false
            SiL.isHidden = false
            break
            
        default:
            break; 
        }
    }
    
    
    
    
    @IBAction func calc (_ sender : AnyObject){
        
        if (C.text!.isEmpty) || (Mn.text!.isEmpty) || (Cr.text!.isEmpty) || (Mo.text!.isEmpty) || (Ni.text!.isEmpty) || (Cu.text!.isEmpty) || (V.text!.isEmpty){
            
            sekve.text = ("Ошибка!")
            
            tempa.text = ("Ошибка!")
            
        }  else{
            var ceshka : Double = 0
            if (alpha){
                
            ceshka = cekv(Double(C.text!)!, Mn: Double(Mn.text!)!, Cr: Double(Cr.text!)!, Mo: Double(Mo.text!)!, Ni: Double(Ni.text!)!, Cu: Double(Cu.text!)!, V: Double(V.text!)!)
                
            } else{
                
                if (Si.text!.isEmpty || P.text!.isEmpty){
                    
                    sekve.text = ("Ошибка!")
                    
                    tempa.text = ("Ошибка!")
                    
                }
                else{
                    ceshka = cekv_gost(Double(C.text!)!, Si: Double(Si.text!)!, Mn: Double(Mn.text!)!, Cr: Double(Cr.text!)!, Mo: Double(Mo.text!)!, Ni: Double(Ni.text!)!, Cu: Double(Cu.text!)!, V: Double(V.text!)!, P: Double(P.text!)!)
                }
            }

            if ( diam.text?.isEmpty)!{
                tempa.text = ("Ошибка!")
                sekve.text = String(format: "%f", ceshka)
            } else{
            let tempeshka = temp (Double(diam.text!)!, cek: ceshka)
        
            sekve.text = String(format: "%f", ceshka)
        
            tempa.text = String(format: "%f", round(tempeshka))
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

func cekv_gost (_ C: Double, Si: Double, Mn: Double, Cr: Double, Mo: Double, Ni: Double, Cu: Double, V: Double, P: Double) -> Double {
    
    return C+Si/24+Mn/6+Cr/5+Mo/4+Ni/40+Cu/13+V/14+P/2
    
}
