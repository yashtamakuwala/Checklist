//
//  AddItemViewController.swift
//  Checklists
//
//  Created by YASH on 22/12/15.
//  Copyright © 2015 YASH. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        textField.becomeFirstResponder()
    }

    weak var delegate: AddItemViewControllerDelegate?
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.addItemViewControllerDidCancel(self)
        //dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func done(sender: AnyObject) {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        
        delegate?.addItemViewController(self, didFinishAddingItem: item)
        
//        print("The contents of the textfield are :\(textField.text)")
//        dismissViewControllerAnimated(true, completion: nil)
        
    }
   
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
    
}