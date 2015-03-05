//
//  ViewController.swift
//  InClassToDoAppPractice
//
//  Created by Bumhan Yu on 2/23/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIAlertViewDelegate {

    var items: [String] = []
    
    @IBAction func didTapAdd(sender: AnyObject) {
        var alert = UIAlertView(title: "Item Name?", message: "Enter an item name", delegate: self, cancelButtonTitle: "Dsmiss", otherButtonTitles: "Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            if let textInAlert = alertView.textFieldAtIndex(0)?.text {
                self.items.append(textInAlert)
                self.ToDoTableView.reloadData()
                
            }
        }
    }
    @IBOutlet weak var ToDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = ToDoTableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell!
                // get a reusable cell to use, if one exists--calling tableView purely in code
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
                // if there's no reusable cell in place, create a new one
        }
        
        var stringAtSpecifiedIndex = self.items[indexPath.row]
        cell.textLabel.text = stringAtSpecifiedIndex
                // populate the cell content
        return cell
    }

}

