//
//  NavbarTableViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/24/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class NavbarTableViewController: UITableViewController {
    let tableItem = ["Home","Profile","Favourite","Settings","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "navbarTableItem", for: indexPath)

        cell.textLabel?.text = tableItem[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        selectedCell.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath)!
        
        deselectedCell.textLabel?.textColor = UIColor.lightGray
    }

  
}
