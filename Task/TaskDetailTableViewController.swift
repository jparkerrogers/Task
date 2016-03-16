//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Jonathan Rogers on 3/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
    
    var dueDateValue: NSDate?

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var noteTextField: UITextView!
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.inputView = dueDatePicker

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func dueDatePickerValueChanged(sender: UIDatePicker) {
        
        self.dateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
        
    }
    
    @IBAction func userTappedView(sender: AnyObject) {
        
        self.nameTextField.resignFirstResponder()
        self.dateTextField.resignFirstResponder()
        self.noteTextField.resignFirstResponder()
        
    }
    
    func updateWithTask(task: Task) {
        
        self.task = task
        
        title = task.name
        
        if let due = task.due {
        
        dateTextField.text = due.stringValue()
        
        }
        
        if let notes = task.notes {
            noteTextField.text = notes
        }
    }
}

