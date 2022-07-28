//
//  ViewController.swift
//  Checklists
//
//  Created by c.toan on 26.07.2022.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [ChecklistItem]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS developer"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Socer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        
    }

    func configurCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
            if item.checked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
            let label = cell.viewWithTag(1000) as! UILabel
            label.text = item.text
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configurCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configurCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    
}

