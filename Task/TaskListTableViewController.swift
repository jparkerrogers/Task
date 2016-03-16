//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Jonathan Rogers on 3/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedController.tasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
        
        let task = TaskController.sharedController.tasks[indexPath.row]
        
        cell.updateWithTask(task)
        
        cell.delegate = self

        return cell
    }
    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let selectedRow = TaskController.sharedController.tasks[indexPath.row]
            
            TaskController.sharedController.removeTask(selectedRow)
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {

        }    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toViewTask" {
            
            let destinationViewController = segue.destinationViewController as?
            TaskDetailTableViewController
            
            if let taskDetailTableViewController = destinationViewController {
                
                _ = taskDetailTableViewController.view
                
                if let selectedRow = tableView.indexPathForSelectedRow?.row {
                    taskDetailTableViewController.updateWithTask(TaskController.sharedController.incompleteTasks[selectedRow])
                }
            }
        }
    }
}

extension TaskListTableViewController: ButtonTableViewCellDelegate {
    
    
    func buttonCellButonTapped(sender: ButtonTableViewCell) {
        
        let indexPath = tableView.indexPathForCell(sender)!
        
        let task = TaskController.sharedController.incompleteTasks[indexPath.row]
        task.isComplete = !task.isComplete.boolValue
        TaskController.sharedController.saveToPersistentStorage()
        
        tableView.reloadData()
    }
}
