//
//  MainTableViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//
//  Edited by Bumhan Yu
//


import UIKit

class MainTableViewController: UITableViewController {

    var task:[Int:String] = [0:"Homework", 1:"Laundry", 2:"Cook", 3:"Sleep"]
    var status:[Int:String] = [0:"Incomplete", 1:"Complete", 2:"Not Started", 3:"Wanted"]
    var dueDate:[Int:String] = [0:"Friday", 1:"Midnight", 2:"Right Away", 3:"Tomorrow"]
    
        // 1. Define three dictionaries for TODO items: task, status and dueDate
        // 2. Each dictionary has Int keys and String values
        // 3. Int keys are used to associate values in each TODO
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as ModalViewController
        destination.todoViewController = self
    }
        // connecting the two views to allow references

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel.text = retrieveText()[indexPath.row]
        
        return cell
    }
    
    func retrieveText() -> (Array<String>) {
        
            // This function iterates each todo dictionary, and returns an array of consolidated strings
        
        var tempString:[String] = []
            // Temporary String array to store consolidated values from three dictionaries

        for i in 0..<(task.count)
        {
            var todos = [task, status, dueDate]

            tempString.append(todos[0][i]! + " (" + todos[1][i]! + ") - Due: " + todos[2][i]!)
            
        }
        return tempString
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
