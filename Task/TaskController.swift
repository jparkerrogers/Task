//
//  TaskController.swift
//  Task
//
//  Created by Jonathan Rogers on 3/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    private let TaskKey = "tasks"
    
    static let sharedController = TaskController()
    
    var tasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Task]
        } catch {
            return []
        }
    }
    
    var completedTasks: [Task] {
        
        return tasks.filter({$0.isComplete.boolValue})
        
    }
    
    var incompleteTasks: [Task] {
        
        return tasks.filter({!$0.isComplete.boolValue})
        
    }
    
    func addTask(task: Task) {
        
        saveToPersistentStorage()
    
    }
    
    func removeTask(task: Task) {
        
        task.managedObjectContext?.deleteObject(task)
        saveToPersistentStorage()
        }
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        }catch {
            print("there was an error saving the Managed Object Context")
        }
        
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}


