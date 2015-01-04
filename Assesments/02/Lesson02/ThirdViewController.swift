//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var evenNumberInput: UITextField!
    // Text field for number input
    
    @IBOutlet weak var displayEvenOrNot: UILabel!
    // Text field for display result
    
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    @IBAction func decideOddOrEven(sender: AnyObject) {
        if let number = evenNumberInput.text.toInt() {
            
            if number % 2 == 0 {
                displayEvenOrNot.text = "Number " + evenNumberInput.text + " is even.";
            } else {
                displayEvenOrNot.text = "Number " + evenNumberInput.text + " is not even.";
            }
            evenNumberInput.text = "";
            // The input field is reset to make it easier for users to type in the next number
            
        } else {
            displayEvenOrNot.text = "Enter an integer!"
            evenNumberInput.text = "";
        }
        
        
    }
    
    
    
    
}
