//
//  NewsFeedViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    let test = ["Testing","Testing","Testing","Testing","Testing"]
    @IBOutlet weak var newsFeedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        self.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
        //        self.navigationController?.isNavigationBarHidden = false
        //        self.navigationController?.navigationBar.isTranslucent = true
        //        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteListItem", for: indexPath) as! NewsTableViewCell
        cell.newsLabel.text = test[indexPath.row]
        return cell
    }

}
