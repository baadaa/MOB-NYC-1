//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdTextView: UITextView!
        // Referencing Outlet for TextView in storyboard
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var textValue = thirdTextView.text
        
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)[0] as? NSURL {
                // get the document path
            
            let filePath = documentPath.URLByAppendingPathComponent("userData.txt")
                // append file path to the document path
                            
            textValue.writeToURL(filePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
                // save data as UTF8 String. 
            
            println("data saved!")
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
