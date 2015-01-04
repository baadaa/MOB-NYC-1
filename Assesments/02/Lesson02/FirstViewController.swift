//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textLabel01: UILabel!
    // Label reference outlets declared
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    // Name and Age reference outlets are prepared
    
    
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    */

    @IBAction func todoOne(sender: AnyObject) {
        textLabel01.text = "Hello, World!";
        nameField.text = "";
        ageField.text = "";

        // Name and Age fields are reset when saying hello to the world.
        // This is to avoid confusion about inputting name for other functions
    }
    
    
    
    
    /*
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”

    */
    

    @IBAction func todoTwo(sender: AnyObject) {
        if verifyFields() == true{
            textLabel01.text = "Hello " + nameField.text + ", you are " + ageField.text + " years old!";
        } else {
            textLabel01.text = "Please enter your \n name and age!";
        }
    // verifyFields function makes sure neither of the text fields is empty
    }
    
    
    /*
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    */

    
    /* :::::::::::: NOTE ::::::::::::
       For TODO three and four, I prepared additional text fields to display results — rather than printing to console.
    */

    @IBAction func todoThree(sender: AnyObject) {
        if let age = ageField.text.toInt() {
            
            textLabel01.text = "";
            // Reset text fields before displaying results
            // to allow additional user inputs and
            // to make sure previous results are cleared out
            
            if age >= 21 {
                textLabel01.text = "You can drink. \n"
            }
            if age >= 18 {
                textLabel01.text = textLabel01.text! + "You can vote. \n";
            }
            if age >= 16 {
                textLabel01.text = textLabel01.text! + "You can drive."
            } else {
                textLabel01.text = "Wait until you turn 16!"
            }
        } else {
            textLabel01.text = "Enter your age!";
        }
    }
    
    
    /*
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */

    @IBAction func todoFour(sender: AnyObject) {
        if let age = ageField.text.toInt(){

            textLabel01.text = "";
            // Reset text fields
            
            if age >= 21 {
                textLabel01.text = "You can drive, vote and drink! \n (but not at the same time)";
            } else if age >= 18 {
                textLabel01.text = "You can drive and vote!";
            } else if age >= 16 {
                textLabel01.text = "You can drive!";
            } else {
                textLabel01.text = "Wait until you turn 16!";
            }
        } else {
            textLabel01.text = "Enter your age!";
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func verifyFields() -> Bool{
        if nameField.text.isEmpty || ageField.text.isEmpty {
            return false;
        } else {
            return true;
        }
    }
    // This function checks whether both Name and Age fields are entered.
    
}

