//
//  Checklist.swift
//  Checklists
//
//  Created by c.toan on 03.08.2022.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem] ()
    
     init(name: String) {
        self.name = name
        super.init()
    }

}
