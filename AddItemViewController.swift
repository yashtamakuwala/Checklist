//
//  AddItemViewController.swift
//  Checklists
//
//  Created by YASH on 22/12/15.
//  Copyright © 2015 YASH. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        textField.becomeFirstResponder()
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func done(sender: AnyObject) {
        print("The contents of the textfield are :\(textField.text)")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
   
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
}