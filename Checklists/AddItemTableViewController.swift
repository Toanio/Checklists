//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by c.toan on 29.07.2022.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func addItemViewControllerDidCancel(
        controller: AddItemTableViewController)
    func addItemViewController(
        _ controller: AddItemTableViewController,
        didFinishAdding: ChecklistItem)
}

class AddItemTableViewController: UITableViewController, UITextFieldDelegate{
    
    weak var delegate: AddItemViewControllerDelegate?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    @IBAction func cancel(){
        delegate?.addItemViewControllerDidCancel(controller: self)
        
    }
    
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!
        
        delegate?.addItemViewController(self, didFinishAdding: item)
        
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    )-> Bool{
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(
            in: stringRange,
            with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
        
    }
    
    func textFieldShouldClear(_ textField: UITextField)-> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}
