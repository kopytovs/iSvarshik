//
//  Termin.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 28.10.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

class Termin: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet var table: UITableView!
    
    let mas = ["alpha", "beta", "gamma", "delta", "blabla", "sosiska", "hotdog", "troll", "koshka", "sobaka", "kit", "anakin", "sergey", "olesya", "github", "spetselectrode"]
    
    var choose = 0
    
    var filtered:[String] = []
    
    var SActive : Bool = false
    
    //var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //self.searchController.searchResultsUpdater = self
        
        //SearchB = searchController.searchBar
        
        //searchController = UISearchController(searchResultsController: nil)
        
       // tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

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
        
        if SActive {
            
            cell.textLabel?.text = filtered[indexPath.row] as String
            
        } else{
            
            cell.textLabel?.text = mas[indexPath.row] as String
            
        }

        // Configure the cell...

        return cell
    }
 
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        choose = indexPath.row
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail"{
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! Cell
                destinationController.name = (SActive) ? filtered : mas
                //destinationController.name = mas
                destinationController.page = (indexPath.row)
            }
            
        }
        
        /*var path = table.indexPathForSelectedRow
        
        let detailViewController = segue.destination as! Cell
        
        detailViewController.page = (path?.row)!
        
        detailViewController.name = mas*/
        
    }
    
    
    /*func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(searchText: searchText)
            tableView.reloadData()
        }
    }
    
    func filterContent (searchText : String){
        filtered = mas.filter({ (les : String) -> Bool in
            let nameMatch = les.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            return nameMatch != nil
        })
    }*/
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        SActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        SActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        SActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = mas.filter({ (text) -> Bool in
            let tmp: String = text as String
            let range = tmp.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            //let range = tmp.rangeO(searchText, options: String.CompareOptions.CaseInsensitive)
            return range != nil
        })
        
        if(filtered.count == 0){
            SActive = false;
        } else {
            SActive = true;
        }
        self.tableView.reloadData()
    }

    
    /*func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
            var path = table.indexPathForSelectedRow
            
            let detailViewController = segue.destination as! Cell
        
            detailViewController.page = (path?.row)!
        
            detailViewController.name = mas
        
        }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
