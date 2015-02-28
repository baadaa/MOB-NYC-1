
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var sixthTextView: UITextView!
        // Referencing Outlet for TextView in storyboard
    
    var convertedString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)[0] as? NSURL {
            // get the document path
            
            let filePath = documentPath.URLByAppendingPathComponent("stringData.txt")
            // append file path to the document path
            
            var savedArrayData = NSArray(contentsOfURL: filePath)
            // retrieve the String value from the file
            
            if let savedArrayDataValue = savedArrayData {
                formatArrayIntoString(savedArrayDataValue)
            }
            
        // Do any additional setup after loading the view.
        }
    }
    
    func formatArrayIntoString(data: NSArray) {
        
        for i in data {
            convertedString += toString(i) + " "
        }
        
        sixthTextView.text = "Saved Array data in String format is \n<< " + convertedString + " >>"
    }
    
}