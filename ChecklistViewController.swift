//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by YASH on 09/12/15.
//  Copyright © 2015 YASH. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {

    
    var items: [ChecklistItem] //// This declares that items will hold an array of ChecklistItem objects but it does not actually create that array.
    // At this point, items does not have a value yet.
    
    required init(coder aDecoder: NSCoder) {
        items = [ChecklistItem]() // This instantiates the array. Now items contains a valid array object, // but the array has no ChecklistItem objects inside it yet.
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)

        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)

        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)

        
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)

        
         
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        //tableView.backgroundView = UIImageView(image: UIImage(named: "IMG_1228"))
//        let image = UIImage(named: "IMG_1228")
//        self.view.backgroundColor = UIColor(patternImage: image!)
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_1228"]];
//        
//        self.tableView.backgroundView = imageView;
//        [imageView release];
//        self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IMG_1228"]];
        
      //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "IMG_1228")!)
        //[self.tableView setBackgroundColor: [UIColor clearColor]];

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem")
        let item = items[indexPath.row]
        let label = cell?.viewWithTag(10) as! UILabel
        
        label.text = item.text
        
        
        configureCheckmarkForCell(cell!, withChecklistItem: item)
        configureTextForCell(cell!, withChecklistItem: item)
        
//        cell.contentView.backgroundColor = [UIColor clearColor];
//        cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
        let item = items[indexPath.row]
        item.toggleChecked()
        
            configureCheckmarkForCell(cell, withChecklistItem: item)
            //configureTextForCell(cell, withChecklistItem: item)
        }
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

 //Swipe to delete row.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        items.removeAtIndex(indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destinationViewController as! UINavigationController //The new view controller can be found in segue.destinationViewController. The storyboard shows that the segue does not go directly to AddItemViewController but to the navigation controller that embeds it. So first you get ahold of this UINavigationController object.
            
            
            let controller = navigationController.topViewController as! AddItemViewController
            
            //To find the AddItemViewController, you can look at the navigation controller’s topViewController property. This property refers to the screen that is currently active inside the navigation controller.
            
            controller.delegate = self
            //Once you have a reference to the AddItemViewController object, you set its delegate property to self and the connection is complete. Note that “self” here refers to the ChecklistViewController.
        }
        
        else if segue.identifier == "Edit Item" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddItemViewController
            
            controller.delegate = self
            
            if let indexPath = tableView.indexPathForCell((sender as? UITableViewCell)!) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem ){
        let label = cell.viewWithTag(11) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem){
        let label = cell.viewWithTag(10) as! UILabel
        label.text = item.text
    }
    
    
    func addItemViewControllerDidCancel(controller: AddItemViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem) {
        let newRowIndex = items.count
        
        items.append(item)
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        dismissViewControllerAnimated(true, completion: nil)
    }
}







