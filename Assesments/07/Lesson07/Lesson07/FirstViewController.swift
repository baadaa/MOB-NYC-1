//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstTextView: UITextView!
        // Referencing Outlet for the TextView in storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loadedString = NSUserDefaults.standardUserDefaults().stringForKey("test_string")
        var loadedNumber = NSUserDefaults.standardUserDefaults().integerForKey("test_number")
            // Retrieve stored data from NSUserDefaults and assign them into variables
        
        if let loadedStringValue = loadedString {
            
            firstTextView.text = "Value for test_string key is \n <<" + loadedStringValue + ">>\n\nValue for test_number key is \n <<" + toString(loadedNumber) + ">>."
            
        }
        // "if let" syntax is used to unwrap optional string value. Then displays the stored value in TextView
        
        
    }
}