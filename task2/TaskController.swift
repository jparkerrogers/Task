//
//  TaskController.swift
//  task2
//
//  Created by Jonathan Rogers on 2/11/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import Foundation

/////HOW DO I CALL THE FUNCTIONS WHEN THE CLASS IS INITIALIZED?

class TaskController {
    
    static var sharedInstance = TaskController()
    
    private let taskKey = "taskKey"
    
    var tasksArray: [Task] = []
    
    var completedTasks: [Task] {
        return tasksArray.filter({ $0.isComplete.boolValue})
    }
    
    var incompleteTask: [Task] {
        return tasksArray.filter({ !$0.isComplete.boolValue})
    }
    
    func addTask(task: Task) {
        tasksArray.append(task)
        
        ///// WHERE DID "task" COME FROM?
    }
    
    func removeTask(indexPath: NSIndexPath) {
        tasksArray.removeAtIndex(indexPath.row)
        
        ////// HOW TO PRESENT MOCK DATA
    }
    
    func saveToPersistentStorage(){
        NSKeyedArchiver.archiveRootObject(self.tasksArray, toFile: self.filePath(taskKey))
    }
    
    func loadToPersistentStorage() {
        NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(taskKey))
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let tasksPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return tasksPath
    }
}