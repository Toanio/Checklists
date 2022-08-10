//
//  ChecklistItem.swift
//  Checklists
//
//  Created by c.toan on 28.07.2022.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
