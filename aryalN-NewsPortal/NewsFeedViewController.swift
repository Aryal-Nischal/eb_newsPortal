//
//  NewsFeedViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

//MARK: - DATA Array
    
    let test = ["Testing","Testing","Testing","Testing","Testing"]

//MARK: - Outlets
    
    @IBOutlet weak var newsFeedTableView: UITableView!
    
//MARK: - View Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        
        revealRearView(controllerHandle: self)
        customNavBarCreation(controllerHandle: self)
    }
    
//MARK: - Delegate and Datasource functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteListItem", for: indexPath) as! NewsTableViewCell
        cell.newsLabel.text = test[indexPath.row]
        return cell
    }
    
//MARK: - View Customization Methods
    
    //For making navigation bar transparent
    func customNavBarCreation(controllerHandle:UIViewController){
        controllerHandle.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        controllerHandle.navigationController?.navigationBar.shadowImage = UIImage()
        controllerHandle.navigationController?.navigationBar.isTranslucent = true
        controllerHandle.navigationController?.view.backgroundColor = UIColor.clear
        controllerHandle.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    //For revealing rearview with gesture
    func revealRearView(controllerHandle:UIViewController){
        controllerHandle.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        controllerHandle.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        controllerHandle.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
    }

}
