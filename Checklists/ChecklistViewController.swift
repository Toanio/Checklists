//
//  ViewController.swift
//  Checklists
//
//  Created by c.toan on 26.07.2022.
//

import UIKit

class ChecklistViewController: UITableViewController {

    let row0text = "Walk the dog"
    let row1text = "Brush my teeth"
    let row2text = "Learn iOS developer"
    let row3text = "Socer practice"
    let row4text = "Eat ice cream"
    
    var row0checked = false
    var row1checked = true
    var row2checked = false
    var row3checked = true
    var row4checked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = row0text
        } else if indexPath.row % 5  == 1 {
            label.text = row1text
        } else if indexPath.row % 5 == 2 {
            label.text = row2text
        } else if indexPath.row % 5 == 3 {
            label.text = row3text
        } else if indexPath.row % 5 == 4 {
            label.text = row4text
        }
        configurCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0checked.toggle()
            } else if indexPath.row == 1 {
                row1checked.toggle()
            } else if indexPath.row == 2 {
                row2checked.toggle()
            } else if indexPath.row == 3 {
                row3checked.toggle()
            } else if indexPath.row == 4 {
                row4checked.toggle()
            }
            configurCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configurCheckmark(
        for cell: UITableViewCell,
        at indexPath: IndexPath) {
            var isChecked = false
            if indexPath.row == 0 {
                isChecked = row0checked
            } else if indexPath.row == 1 {
                isChecked = row1checked
            } else if indexPath.row == 2 {
                isChecked = row2checked
            } else if indexPath.row == 3 {
                isChecked = row3checked
            } else if indexPath.row == 4 {
                isChecked = row4checked
            }
            if isChecked {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
    
    
}

