//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondTextView: UITextView!
        // Referencing Outlet for TextView in storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var settingsName = NSUserDefaults.standardUserDefaults().stringForKey("settings_name")
        var settingsSlider = NSUserDefaults.standardUserDefaults().doubleForKey("settings_slider")
            // Retrieve stored data from NSUserDefaults and assign them into variables
        
        if let settingsNameValue = settingsName ?? "[empty]" {
        
            secondTextView.text = "Value for settings_name is \n <<" + settingsNameValue + ">>\n\nValue for settings_slider position is \n <<" + toString(settingsSlider) + ">>"
            // Display stored setting values to TextView. When a "settings_name" String is nil, display "empty" instead.
            
        }
        // Do any additional setup after loading the view.
    }
    
}
