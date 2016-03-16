//
//  TaskController.swift
//  Task
//
//  Created by Jonathan Rogers on 3/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    private let TaskKey = "tasks"
    
    var tasks: [Task] = []
    
    static let sharedController = TaskController()
    
    init() {
        
        loadFromPersistentStorage()
    }
    
    var completedTasks: [Task] {
        
        return tasks.filter({$0.isComplete})
        
    }
    
    var incompleteTasks: [Task] {
        
        return tasks.filter({!$0.isComplete})
        
    }
    
    func addTask(task: Task) {
        
        tasks.append(task)
        
        saveToPersistentStorage()
    
    }
    
    func removeTask(task: Task) {
        
        if let taskIndex = tasks.indexOf(task) {
            tasks.removeAtIndex(taskIndex)
            
            saveToPersistentStorage()
        }
        
    }
    
    func saveToPersistentStorage() {
        
        NSKeyedArchiver.archiveRootObject(self.tasks, toFile: self.filePath(TaskKey))
        
    }
    
    func loadFromPersistentStorage() {
        
        let unarchivedTasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(TaskKey))
        
        if let tasks = unarchivedTasks as? [Task] {
            self.tasks = tasks
        }
        
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }

}
