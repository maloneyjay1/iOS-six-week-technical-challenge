//
//  ItemDetailViewController.swift
//  week6
//
//  Created by Jay Maloney on 11/18/15.
//  Copyright © 2015 Jay Maloney. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var titleTextField: UITextField!
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        
        titleTextField.text = ""
        
    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let item = self.item {
            item.title = self.titleTextField.text!
        } else {
            let newItem = Item(title: self.titleTextField.text!, text: "")
            ItemController.sharedController.addItem(newItem)
            self.item = newItem
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func updateWithItem(item: Item) {
        self.item = item
        self.titleTextField.text = item.title
     
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
}