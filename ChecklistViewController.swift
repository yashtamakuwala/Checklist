//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by YASH on 09/12/15.
//  Copyright © 2015 YASH. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

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

    
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem ){
        
        
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem){
        let label = cell.viewWithTag(10) as! UILabel
        label.text = item.text
    }
    
}







