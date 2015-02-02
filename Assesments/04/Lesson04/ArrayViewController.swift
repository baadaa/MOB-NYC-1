//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,  UITextFieldDelegate {

    var textArray: [String] = []
    
    @IBOutlet var arrayTable: UITableView!
    @IBOutlet weak var textInputField: UITextField!
        // Reference outlets for TableView and TextField

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = textArray[indexPath.row]
        return cell
    }   // Populate TableViewCells with Strings in textArray
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // When Return key is tapped...
        // If TextField is not empty, the code block runs
        
        if textInputField.text != "" {
            textArray.append(textInputField.text)
            textInputField.text = ""
            arrayTable.reloadData()
            // Append the Array, reload the TableView, and clear TextField for easier next input
            
        } else {
            println("empty input")
            textInputField.resignFirstResponder()
        }   // if TextField is left empty, Array remains unchanged and keyboard is dismissed
        
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayTable.delegate = self
        arrayTable.dataSource = self
            // Delegate and DataSource to TableView itself
        textInputField.delegate = self
            // TextField delegate to self
        
        /*
        TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
        TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
        
        */
    }
    
}

