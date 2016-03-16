//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Jonathan Rogers on 3/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?

    @IBOutlet weak var primaryLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if let delegate = delegate {
            delegate.buttonCellButonTapped(self)
        }
    }
    
    func updateButton(isComplete: Bool) {
        
        if isComplete {
            button.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}
protocol ButtonTableViewCellDelegate {
    
    func buttonCellButonTapped(sender: ButtonTableViewCell)
}

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        
        primaryLabel.text = task.name
        
        updateButton(task.isComplete.boolValue)
        
    }
    
}
