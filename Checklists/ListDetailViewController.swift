//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by c.toan on 04.08.2022.
//

import UIKit

protocol ListDetailViewControllerDelegate: AnyObject {
    func listDetailViewControllerDidCancel (
        _ controller: ListDetailViewController)
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishAdding checklist: Checklist
    )
    func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishEditing checklist: Checklist
    )
}
class ListDetailViewController: UITableViewController, UITextFieldDelegate {
        @IBOutlet var textField: UITextField!
        @IBOutlet var doneBarButton: UIBarButtonItem!
        
        weak var delegate: ListDetailViewControllerDelegate?
        
        var checkListToEdit: Checklist?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let checklist = checkListToEdit {
                title = "Edit Checklist"
                textField.text = checklist.name
                doneBarButton.isEnabled = true
            }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            textField.becomeFirstResponder()
        }
        
        override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
        }
        
        func textField(
            _ textField: UITextField,
            shouldChangeCharactersIn range: NSRange,
            replacementString string: String) -> Bool {
                let oldText = textField.text!
                let stringRange = Range(range, in: oldText)!
                let newText = oldText.replacingCharacters(
                    in: stringRange,
                    with: string)
                doneBarButton.isEnabled = !newText.isEmpty
                return true
            }
        
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            doneBarButton.isEnabled = false
            return true
        }
        
        
        //MARK: - Actions
        @IBAction func cancel() {
            delegate?.listDetailViewControllerDidCancel(self)
        }
        
        @IBAction func done() {
            if let checklist = checkListToEdit {
                checklist.name = textField.text!
                delegate?.listDetailViewController(
                    self,
                    didFinishEditing: checklist)
            } else {
                let checklist = Checklist(name: textField.text!)
                delegate?.listDetailViewController(
                    self,
                    didFinishAdding: checklist)
            }
        }
        
        
    }
    
