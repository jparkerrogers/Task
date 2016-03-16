//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Jonathan Rogers on 3/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

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
        
        updateTask()
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        self.nameTextField.text = ""
        self.dateTextField.text = ""
        self.noteTextField.text = ""
        
    }
    
    @IBAction func dueDatePickerValueChanged(sender: UIDatePicker) {
        
        self.dateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
//        let todaysDate = dueDatePicker.
        
        // i want to see if If i can set the current date as the default value before the person taps the date.
        
    }
    
    @IBAction func userTappedView(sender: AnyObject) {
        
        self.nameTextField.resignFirstResponder()
        self.dateTextField.resignFirstResponder()
        self.noteTextField.resignFirstResponder()
        
    }
    
    func updateTask() {
        
        let name = nameTextField.text!
        let due = dueDateValue
        let notes = noteTextField.text
        
        if let task = self.task {
            task.name = name
            task.due = due
            task.notes = notes
        } else {
            
            let newTask = Task(name: name, notes: notes, due: due)
            
            TaskController.sharedController.addTask(newTask)
        }
    }
    
    func updateWithTask(task: Task) {
        
        self.task = task
        
        /// self.task = task is used so that I do not need to force unwrap my objects.
        
        title = task.name
        
        if let due = task.due {
        
        dateTextField.text = due.stringValue()
        
        }
        
        if let notes = task.notes {
            noteTextField.text = notes
        }
    }
}

