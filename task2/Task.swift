//
//  Task.swift
//  task2
//
//  Created by Jonathan Rogers on 2/11/16.
//  Copyright © 2016 Jonathan Rogers. All rights reserved.
//

import Foundation


class Task: NSObject, NSCoding{
    
    private let nameKey = "nameKey"
    private let notesKey = "notesKey"
    private let dueKey = "dueKey"
    private let isCompleteKey = "isCompleteKey"
    
    let name: String
    let notes: String?
    let due: NSDate?
    let isComplete: Bool
    
    init(name: String, notes: String, due: NSDate, isComplete: Bool) {
        self.name = name
        self.notes = notes
        self.due = nil
        self.isComplete = false
        
        //////WHY DO I HAVE 3 INITIALIZERS. AND WHAT IS THE REAL DEFINITION OF "INITIALIZE" IN SWIFT
    }
    
    @objc required init?(coder aDecoder: NSCoder){
        guard let name = aDecoder.decodeObjectForKey(nameKey) as? String, notes = aDecoder.decodeObjectForKey(notesKey) as? String, due = aDecoder.decodeObjectForKey(dueKey) as? NSDate, isComplete = aDecoder.decodeObjectForKey(isCompleteKey) as? Bool else {
            
            ////// IS THIS SAYTING THAT IF THERE IS A KEY, THEN THE RETURNED VALUE WOULD BE DECODED INTO "NAMEKEY"?
            
            self.name = ""
            self.notes = ""
            self.due = nil
            self.isComplete = false
            super.init()
            return nil
        }
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
        super.init()
        return nil
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.name, forKey: nameKey)
        aCoder.encodeObject(self.notes, forKey: notesKey)
        aCoder.encodeObject(self.due, forKey: dueKey)
        aCoder.encodeObject(self.isCompleteKey, forKey: isCompleteKey)
    }
}

func == (lhs: Task, rhs: Task) -> Bool {
    return (lhs.name == rhs.name) && (lhs.notes == rhs.notes)
}
