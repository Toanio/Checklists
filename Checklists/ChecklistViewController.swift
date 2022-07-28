//
//  ViewController.swift
//  Checklists
//
//  Created by c.toan on 26.07.2022.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [ChecklistItem] ()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item1.text = "Brush my teeth"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item1.text = "Learn iOS developer"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item1.text = "Socer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item1.text = "Eat ice cream"
        items.append(item5)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        let item = items[indexPath.row]
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = item.text
        } else if indexPath.row % 5  == 1 {
            label.text = item.text
        } else if indexPath.row % 5 == 2 {
            label.text = item.text
        } else if indexPath.row % 5 == 3 {
            label.text = item.text
        } else if indexPath.row % 5 == 4 {
            label.text = item.text
        }
        configurCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                item.checked.toggle()
            } else if indexPath.row == 1 {
                item.checked.toggle()
            } else if indexPath.row == 2 {
                item.checked.toggle()
            } else if indexPath.row == 3 {
                item.checked.toggle()
            } else if indexPath.row == 4 {
                item.checked.toggle()
            }
            configurCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configurCheckmark(
        for cell: UITableViewCell,
        at indexPath: IndexPath) {
            var isChecked = false
            let item = items[indexPath.row]
            if indexPath.row == 0 {
                isChecked = item.checked
            } else if indexPath.row == 1 {
                isChecked = item.checked
            } else if indexPath.row == 2 {
                isChecked = item.checked
            } else if indexPath.row == 3 {
                isChecked = item.checked
            } else if indexPath.row == 4 {
                isChecked = item.checked
            }
            if isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
    
    
}

