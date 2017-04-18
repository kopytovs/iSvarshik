//
//  Termin.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit
import FirebaseDatabase
import DZNEmptyDataSet
import ChameleonFramework

class Termin: UITableViewController, UISearchBarDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var SBar: UISearchBar!
    
    let terminsRef = FIRDatabase.database().reference().child("Termins")
    
    var mas = Array<String>()
    
    var exp_dict = Dictionary<String, String>()
    
    var choose = 0
    
    var filtered:[String] = []
    
    var SActive : Bool = false
    
    var temp:String = ""
    
    let backr = #imageLiteral(resourceName: "backgr1")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SBar.keyboardAppearance = .dark
        
        SBar.showsCancelButton = false
        
        temp = SBar.text!
        
        //tableView.delegate = self
        //tableView.dataSource = self
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        self.view.backgroundColor = UIColor(patternImage: backr)
        
        self.loadInfo()
        
        //self.navigationController?.hidesNavigationBarHairline = true
        //self.setStatusBarStyle(UIStatusBarStyle(rawValue: 1)!)
        //UIApplication.shared.statusBarStyle = .lightContent
        
    }

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
    

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.center.y += self.view.bounds.height
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
            
            cell.center.y -= self.view.bounds.height
            
        }, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCell", for: indexPath) as UITableViewCell

        cell.textLabel?.text = (SActive && !filtered.isEmpty) ? filtered[indexPath.row] as String : mas[indexPath.row] as String
        
        let tmp = UIColor(patternImage: backr)
        
        cell.textLabel?.textColor = ContrastColorOf(tmp, returnFlat: true)
        
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
                self.tableView.cellForRow(at: indexPath)?.isSelected = false
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
    
    private func loadInfo(){
        
        //var index = 83
        
        let roll = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        roll.hidesWhenStopped = true
        
        roll.startAnimating()
        
        terminsRef.queryOrdered(byChild: "name").observeSingleEvent(of: .value, with: {snap in
            
            if (snap.value is NSNull) {
                print ("беда")
                //self.isLoadInfo()
            } else{
                for child in snap.children{
                    let data = child as! FIRDataSnapshot
                    let value = data.value! as! [String:Any]
                    let tmp_name: String = value["name"] as! String
                    let tmp_descr: String = value["description"] as! String
                    self.mas.append(tmp_name)
                    self.exp_dict[tmp_name] = tmp_descr
                }
                //self.isLoadInfo()
                self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
                self.tableView.separatorColor = FlatOrange()
                self.tableView.reloadData()
            }
        
        })
        
        roll.stopAnimating()
        
    }
    
    /*private func isLoadInfo(){
        if self.mas.isEmpty{
            let alert = UIAlertController(title: "Ошибка", message: "Невозможно загрузить данные, отсутствует подключение к интернету. Пожалуйста проверьте свое подключение и повторите попытку.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .destructive, handler: {action -> Void in
                
                self.performSegue(withIdentifier: "fromTerminsToSecond", sender: self)
                
            })
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }*/

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Нет соединения"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Соединение с серверами разорвано. Проверьте подключение к сети интернет и повторите попытку."
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        let str = "Попробовать снова"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout), NSForegroundColorAttributeName: FlatOrange()]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        self.loadInfo()
    }
    
}
