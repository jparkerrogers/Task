//
//  TaskListTableViewController.swift
//  task2
//
//  Created by Jonathan Rogers on 2/11/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasksArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listTaskCell", forIndexPath: indexPath)
        
        let task = TaskController.sharedInstance.tasksArray[indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.notes
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToDetailedTask" {
    
                let destinationViewController = segue.destinationViewController as?
                TaskDetailTableViewController
                
                if let taskDetailTableViewController = destinationViewController {
                    _ = taskDetailTableViewController.view
                    
                    if let selectedRow = tableView.indexPathForSelectedRow?.row {
                        taskDetailTableViewController.updateWithTask(TaskController.sharedInstance.incompleteTask[selectedRow])
                        
                        
                        
////////   STUDY THE PREPARE FOR SEGUE
                    }
                    
                    
                }
            }
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            TaskController.sharedInstance.tasksArray.removeAtIndex(indexPath.row)
    
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            TaskController.sharedInstance.saveToPersistentStorage()
        }
        
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


