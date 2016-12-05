//
//  CollectionViewController.swift
//  iсварщик
//
//  Created by Sergey Kopytov on 08.11.16.
//  Copyright © 2016 Sergey Kopytov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellIdentifier"

class CollectionViewController: UICollectionViewController {
    
    var names = ["Сварка нержавеющих сталей", "Сварка высокоуглеродистых сталей", "Сварка чугуна", "Сварка алюминия", "Ремонт и наплавка изношенных поверхностей. Защита от износа", "Наплавка против абразивного износа", "Техника безопастности при сварке", "Сварочные деформации", "Наплавка инструментальных"]
    var videos = ["https://www.youtube.com/embed/2DvrTTEsynU", "https://www.youtube.com/embed/4iphDNrNA9U", "https://www.youtube.com/embed/VDjUXHAjOO8", "https://www.youtube.com/embed/RYUWM5bJAyY", "https://www.youtube.com/embed/LwSSdP0h25E", "https://www.youtube.com/embed/RBS3FkoSrSU", "https://www.youtube.com/embed/A2ChzS_U3uo", "https://www.youtube.com/embed/seX5IZG65HI", "https://www.youtube.com/embed/M98Z-wkkj1o"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        self.collectionView?.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "backgr1"))
        
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
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        //cell.backgroundColor = UIColor.blue
        
        // Configure the cell
        
        cell.NameOfTheVideo.text = names[indexPath.row]
        
        cell.VideoL.allowsInlineMediaPlayback = true
        
        cell.VideoL.scrollView.isScrollEnabled = false
        
        cell.VideoL.loadHTMLString("<iframe width=\"\(cell.VideoL.frame.width)\" height=\"\(cell.VideoL.frame.height)\" src=\"\(videos[indexPath.row])?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        cell.NameOfTheVideo.textColor = UIColor.white
        
        cell.backgroundColor = .clear
    
        return cell
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
