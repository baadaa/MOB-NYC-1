//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var messageOutput: UILabel!
        // Prepare TextFields and Label for functionality
    
    var todoViewController: MainTableViewController?
        // variable for communication between MainTableViewController and ModalViewController

    
    @IBAction func didTapAddButton(sender: AnyObject) {
        
        if taskTextField.text != "" && statusTextField.text != "" && dueDateTextField != "" {
            // Adding values occurs, ONLY when none of three text fields is left empty
            
            var newIndex =  todoViewController?.task.count
                // This number acts as new Key for added value to each dictionary
            
            todoViewController?.task[newIndex!] = taskTextField.text
            todoViewController?.status[newIndex!] = statusTextField.text
            todoViewController?.dueDate[newIndex!] = dueDateTextField.text
                // New Key and Value are added to each dictionary per input value

            taskTextField.text = ""
            statusTextField.text = ""
            dueDateTextField.text = ""
                // Input TextFields are reset
            
            messageOutput.text = "New TODO is added!"
            taskTextField.becomeFirstResponder()
                // Displays success message and move cursor to the first TextField
            
        } else {
            messageOutput.text = "Fill out all text fields!"
                // If any of three TextFields left empty, display an error message
        }
    }
    
    
    @IBAction func didTapDoneButton(sender: AnyObject) {
        
        if taskTextField.text != "" || statusTextField.text != "" || dueDateTextField.text != "" {
            // If any of three TextFields isn't empty, it might mean user might still be adding another TODO. Don't leave the Modal view yet.
            messageOutput.text = "There's unfinished input!"
        }
        else {
            dismissViewControllerAnimated(true, completion: nil)
            // Close the Modal view
        }
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
            // capture return key, and delegate the interaction to next step
        
        if textField == taskTextField
            {
                textField.resignFirstResponder()
                statusTextField.becomeFirstResponder()
                    // If return key is hit from the first TextField, move to the second TextField
            }
                else if textField == statusTextField
            {
                textField.resignFirstResponder()
                dueDateTextField.becomeFirstResponder()
                    // If return key is hit from the second, move to the third
            }
                else if textField == dueDateTextField
            {
                textField.resignFirstResponder()
                didTapAddButton(textField)
                    // If return key is hit from the third, consider ADD button is tapped
            }
        
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTextField.delegate = self
        statusTextField.delegate = self
        dueDateTextField.delegate = self
            // add delegation to each TextField

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

