//
//  FavouritesViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    
//MARK: - Outlets
    
    @IBOutlet weak var favouriteItemList: UITableView!
    
//MARK: - DataArray
    
    let swiftBlogs = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]
    
    
//MARK: - LifecycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteItemList.delegate = self
        favouriteItemList.dataSource = self
        revealRearView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customNavBarCreation()
    }
    
//MARK: - Table Delegate and Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftBlogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteListItem", for: indexPath) as! NewsTableViewCell
        cell.newsLabel.text = swiftBlogs[indexPath.row]
        
        return cell
    }

//MARK: - Custom Button Method
    
    //For toggling the navigation bar on/off
    @IBAction func navbarButton(_ sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
//MARK: - View Customization Methods
    
    //For making navigation bar transparent
    func customNavBarCreation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName:UIFont(name:"Exo-Medium",size:18)!]
    }
    
    //For revealing rearview with gesture
    func revealRearView(){
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        self.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
    }
    
}
