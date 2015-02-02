//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mapTableView: UITableView!
        // Reference outlets for two input TextFields, a message output Label and a TableView

    var emailMapArray:[[String:String]] = []
        // Array of Dictionaries to store input data

    let notificationCenter = NSNotificationCenter.defaultCenter()
        // Declare a variable for NotificationCenter
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == nameTextField {
            if nameTextField.text == "" {
                messageLabel.text = "Please enter name!"
                
            } else {
                textField.resignFirstResponder()
                emailTextField.becomeFirstResponder()
            }
                // When Return key is tapped on the first TextField, check if the TextField is empty. If so, prompt the user to enter String; otherwise, move to the next input field
            
        } else if textField == emailTextField {
            if nameTextField.text != "" && emailTextField.text != "" {
                textField.resignFirstResponder()
                
                emailMapArray.append([nameTextField.text:emailTextField.text])
                mapTableView.reloadData()
                nameTextField.text = ""
                emailTextField.text = ""
                
                    // When Return key is tapped on the second TextField, and both TextFields have non-empty String values, append the Strings as Key/Value pair into the Dictionary Array, reload the TableView, and reset input TextFields
                
            } else {
                messageLabel.text = "Please enter both data fields!"
            }
                    // If any of the two input TextFields are empty, prompt the user to enter both values.
        }
        
        
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        messageLabel.text = ""
    }   // When user start entering data in any TextField, message goes blank
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailMapArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        var dict = emailMapArray[indexPath.row]
            // Pull the Dictionary item from the Array at indexPath
        
        if let key = dict.keys.first {
            // NOTE: I found this part, but not exactly clear how this works
            
            cell.textLabel.text = "\(key) ( \(dict[key]!) )"
        }
        
        return cell
    }   // Populate TableViewCells with Strings in Dictionary Array
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
            // TextFields delegate to self
        
        mapTableView.delegate = self
        mapTableView.dataSource = self
            // TableView delegate and dataSource 
        
        notificationCenter.addObserverForName(
            UIKeyboardDidHideNotification,
            object: nil,
            queue: nil,
            usingBlock: { (notificationCenter) -> Void in
                self.nameTextField.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
                self.emailTextField.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
            }
        )   // Notification Observer for Keyboard disappearing
        
        notificationCenter.addObserverForName(
            UIKeyboardWillShowNotification,
            object: nil,
            queue: nil,
            usingBlock: { (notificationCenter) -> Void in
                self.nameTextField.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.7)
                self.emailTextField.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.7)
            }
        )   // Notification Observer for Keyboard appearing
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
    }
}
