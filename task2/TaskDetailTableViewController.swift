//
//  TaskDetailTableViewController.swift
//  task2
//
//  Created by Jonathan Rogers on 2/11/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dueDateTextField: UITextField!
    
    @IBOutlet weak var notesTextField: UITextView!

    @IBOutlet var dueDatePicker: UIDatePicker!
    
    ///////////////ACTIONS
    
    var task: Task?
    
    var dueDateValue: NSDate?
    
    func updateDueDateValue() {
        duePickerValueChanged(<#T##sender: AnyObject##AnyObject#>)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDateTextField.inputView = dueDatePicker

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
        
        
    }
    
    func updateWithTask(task: Task) {
        nameTextField.text = task.name
        dueDateTextField.text = task.due?.stringValue()
        notesTextField.text = task.notes
    }

    @IBAction func duePickerValueChanged(sender: AnyObject) {
    }
    
    
    @IBAction func userTappedView(sender: AnyObject) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextField.resignFirstResponder()
    }

}


extension NSDate {

func stringValue() -> String {
    let formatter = NSDateFormatter()
    formatter.dateStyle = .MediumStyle
    
    return formatter.stringFromDate(self)
    }
}

