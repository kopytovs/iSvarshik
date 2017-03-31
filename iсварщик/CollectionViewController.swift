//
//  CollectionViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 08.11.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit
import FirebaseDatabase
import DZNEmptyDataSet
import ChameleonFramework

private let reuseIdentifier = "videoCell"

class CollectionViewController: UICollectionViewController, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {
    
    let videosRef = FIRDatabase.database().reference().child("Videos")
    
    var videos = Array<String>()
    var names = Array<String>()
    
    let backr = UIColor(patternImage: #imageLiteral(resourceName: "backgr1"))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        self.collectionView?.emptyDataSetDelegate = self
        self.collectionView?.emptyDataSetSource = self
        
        if Reachability.isConnectedToNetwork(){
            self.loadInfo()
        }
        
        self.collectionView?.backgroundColor = backr
        
        self.navigationController?.hidesNavigationBarHairline = true
        self.setStatusBarStyle(UIStatusBarStyle(rawValue: 1)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return names.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        //cell.backgroundColor = UIColor.blue
        
        // Configure the cell
        
        cell.NameOfTheVideo.text = names[indexPath.row]
        
        //cell.VideoL.allowsInlineMediaPlayback = true
        
        cell.VideoL.scrollView.isScrollEnabled = false
        
        cell.VideoL.loadHTMLString("<body style=\"margin: 0; padding: 0;\"><iframe width=\"\(cell.VideoL.frame.width)\" height=\"\(cell.VideoL.frame.height)\" src=\"\(videos[indexPath.row])?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe></body>",baseURL: nil)
        
        //cell.VideoL.loadHTMLString("<iframe width=\"\(cell.VideoL.frame.width)\" height=\"\(cell.VideoL.frame.height)\" src=\"\(videos[indexPath.row])?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        cell.NameOfTheVideo.textColor = ContrastColorOf(backr, returnFlat: true)
        
        cell.backgroundColor = .clear
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.center.x += self.view.bounds.height
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
        
            cell.center.x -= self.view.bounds.height
        
        }, completion: nil)
    }
    
    private func loadInfo(){
        
        //var index = 83
        
        let roll = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        roll.hidesWhenStopped = true
        roll.startAnimating()
        
        videosRef.queryOrdered(byChild: "source").observeSingleEvent(of: .value, with: {snap in
            
            if (snap.value is NSNull) {
                print ("беда")
                //self.isLoadInfo()
            } else{
                for child in snap.children{
                    let data = child as! FIRDataSnapshot
                    let value = data.value! as! [String:Any]
                    let tmp_name: String = value["name"] as! String
                    let tmp_src: String = value["source"] as! String
                    self.names.append(tmp_name)
                    self.videos.append(tmp_src)
                    //self.videos[tmp_name] = tmp_src
                }
                //self.isLoadInfo()
                self.collectionView?.reloadData()
            }
            
        })
        
        roll.stopAnimating()
        
    }
    
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}



