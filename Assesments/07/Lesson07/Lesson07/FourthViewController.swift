//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var fourTextView: UITextView!
        // Referencing Outlet for TextView in storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)[0] as? NSURL {
                // get the document path
            
            let filePath = documentPath.URLByAppendingPathComponent("userData.txt")
                // append file path to the document path
            
            var savedUserData = String(contentsOfURL: filePath)
                // retrieve the String value from the file
            
            if let savedUserDataValue = savedUserData {
                fourTextView.text = "Saved text data from previous todo is: \n--------------------------------------------\n\n" + savedUserDataValue
            }
        
        // Do any additional setup after loading the view.
        }
    }
}