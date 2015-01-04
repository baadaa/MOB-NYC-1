//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var currentSum:Int = 0;
    // This variable is to store current value of cumulative sum; it starts with zero, naturally.
    
    @IBOutlet weak var numberField: UITextField!
    // Text field reference outlet for number input
    
    @IBOutlet weak var sumDisplay: UILabel!
    // Text field reference outlet is prepared for displaying cumulative sums
    

    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    
    @IBAction func todoFive(sender: AnyObject) {
        if let number = numberField.text.toInt() {
            currentSum = currentSum + number;
            sumDisplay.text = String(currentSum);
            numberField.text = "";
            // After displaying the current sum result, number input field is reset; this is to make sure to proceed only with new user inputs;
        } else {
            numberField.text = "";
        }
    }
    
    
}
