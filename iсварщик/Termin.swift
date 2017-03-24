//
//  Termin.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit
//import Firebase
import FirebaseDatabase

class Termin: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var SBar: UISearchBar!
    
    //let mas = ["Автоматическая сварка", "Вводная планка", "Вылет электрода", "Газовая сварка", "Двусторонняя сварка", "Диффузионная сварка", "Дуговая сварка", "Индукционная сварка", "Контактная сварка", "Лазерная сварка", "Левый способ сварки", "Место возобновления шва", "Многопроходная сварка", "Наклон горелки", "Наплавка (сваркой)", "Неостающаяся подкладка", "Обратноступенчатая сварка", "Однопроходная сварка", "Односторонняя сварка", "Остающаяся подкладка", "Параметры сварки", "Погонная энергия El", "Подкладка", "Плотность эффективной энергии Ql", "Полностью механизированная сварка", "Правый способ сварки", "Прихватка", "Производительность наплавки", "Расстояние от мундштука до изделия", "Рельефная сварка", "Роботизированная сварка", "Ручная сварка", "Сварка взрывом", "Сварка давлением", "Сварка металлов", "Сварка плавлением", "Сварка прихватками", "Сварка с поперечным колебанием горелки", "Сварка трением", "Сварка трением с перемешиванием", "Сварка углом вперед", "Сварка углом назад", "Скорость сварки", "Соединение (сваркой)", "Стыковая сварка оплавлением", "Стыковая сварка сопротивлением", "Температура между проходами Тi", "Температура предварительного подогрева Тр", "Термитная сварка", "Точечная контактная сварка", "Угол между горелкой и изделием", "Холодная сварка", "Частично механизированная сварка", "Шовная сварка внахлестку", "Электрошлаковая сварка", "Эффективный КПД процесса нагрева"]
    
    //var dataBase = FIRDatabase.database().reference()
    
    let terminsRef = FIRDatabase.database().reference().child("Termins")
    
    var mas = Array<String>()
    
    var exp_dict = Dictionary<String, String>()
    
    var choose = 0
    
    var filtered:[String] = []
    
    var SActive : Bool = false
    
    var temp:String = ""
    
    //var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.table.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        SBar.keyboardAppearance = .dark
        
        SBar.showsCancelButton = false
        
        temp = SBar.text!
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgr1"))
        
        self.loadInfo()
        
    }
    
    //@IBAction func unwindToSecond(segue: UIStoryboardSegue){
        //self.performSegue(withIdentifier: "fromTerminsToSecond", sender: self)
    //}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if SActive {
            
            return filtered.count
            
        } else{
            
            return mas.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCell", for: indexPath) as UITableViewCell

        cell.textLabel?.text = (SActive && !filtered.isEmpty) ? filtered[indexPath.row] as String : mas[indexPath.row] as String
        
        cell.textLabel?.textColor = UIColor.white
        
        cell.backgroundColor = .clear

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! Cell
                destinationController.name = ((SActive) && !(filtered.isEmpty)) ? filtered[indexPath.row] : mas[indexPath.row]
                destinationController.exp = (((SActive) && !(filtered.isEmpty)) ? exp_dict[filtered[indexPath.row]] : exp_dict[mas[indexPath.row]])!
        }
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        SActive = true;
        //tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        SActive = false;
        //tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = temp
        searchBar.showsCancelButton = false
        view.endEditing(true)
        SActive = false;
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        SActive = true;
        //tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = mas.filter({ (text) -> Bool in
            let tmp: String = text as String
            let range = tmp.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            //let range = tmp.rangeO(searchText, options: String.CompareOptions.CaseInsensitive)
            return range != nil
        })
        
        if(filtered.isEmpty){
            SActive = false;
        } else {
            SActive = true;
        }
        self.tableView.reloadData()
    }
    
    //override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        /*cell.center.x += self.view.bounds.height
        
        UIView.animate(withDuration: 0.7, delay: 0.1, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveLinear, animations: {
        
            cell.center.x -= self.view.bounds.height
        
        }, completion: nil)*/
        
    //}
    
    private func loadInfo(){
        
        //var index = 83
        
        terminsRef.queryOrdered(byChild: "name").observeSingleEvent(of: .value, with: {snap in
            
            if (snap.value is NSNull) {
                print ("беда")
                self.isLoadInfo()
            } else{
                for child in snap.children{
                    let data = child as! FIRDataSnapshot
                    let value = data.value! as! [String:Any]
                    let tmp_name: String = value["name"] as! String
                    let tmp_descr: String = value["description"] as! String
                    self.mas.append(tmp_name)
                    self.exp_dict[tmp_name] = tmp_descr
                }
                self.isLoadInfo()
                self.tableView.reloadData()
            }
        
        })
        
        
        
    }
    
    private func isLoadInfo(){
        if self.mas.isEmpty{
            let alert = UIAlertController(title: "Ошибка", message: "Невозможно загрузить данные, отсутствует подключение к интернету. Пожалуйста проверьте свое подключение и повторите попытку.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .destructive, handler: {action -> Void in
                
                self.performSegue(withIdentifier: "fromTerminsToSecond", sender: self)
                
            })
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }

    
    
}


