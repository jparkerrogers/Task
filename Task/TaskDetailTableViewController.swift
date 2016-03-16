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

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var noteTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        
        
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

