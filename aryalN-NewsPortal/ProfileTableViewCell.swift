//
//  ProfileTableViewCell.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/5/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell, UITextFieldDelegate {

//MARK: - Outlets
    
    @IBOutlet weak var profileCellLabel: UILabel!
    @IBOutlet weak var profileCellTextField: UITextField!
    
    var array:Array<String>? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileCellTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func handleTextField(path:Int,text:String?){
        array?[path]=text!
    }
    func returnArray(){
        print(array)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as! UITableViewCell
        let view = cell.superview?.superview as! UITableView
        let indexPath = view.indexPath(for: cell)
        print(indexPath?.row)
    }

}
