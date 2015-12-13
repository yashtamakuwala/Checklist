//
//  ChecklistItem.swift
//  Checklists
//
//  Created by YASH on 13/12/15.
//  Copyright © 2015 YASH. All rights reserved.
//

import Foundation

class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }

}

