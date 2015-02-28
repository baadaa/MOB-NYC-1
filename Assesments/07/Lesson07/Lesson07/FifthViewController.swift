//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController, UIAlertViewDelegate {

    @IBAction func addStringButtonTapped(sender: AnyObject) {
        var alert = UIAlertView(title: "Add Data", message: "Enter strings in space-delimited manner", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            if let textInAlert = alertView.textFieldAtIndex(0)?.text {
                stringsIntoArray(textInAlert)
            }
        }
    }
    
    func stringsIntoArray(textInput: String) {
        
        var lengthOfString = countElements(textInput)
        var array:[String] = []
        var tempString:String = ""
        
        for i in 0...(lengthOfString-1) {
            let ithCharacter = textInput[(advance(textInput.startIndex, i))]
            
            if ithCharacter != " " {
                tempString += toString(ithCharacter)
            } else {
                array.append(tempString)
                tempString = ""
            }
        }
            // 1. Loops through the String one character at a time, checking for a space.
            // 2. If the given character is not " ", it's added to tempString
            // 3. If the given character is " ", tempString is appended to array and reset
            // 4. This FOR loop doesn't catch the string after the last " ", so it needs to be added after the FOR loop is complete.
        
        array.append(tempString)
            // This line catches the final string and adds to the array
        
        saveToFile(array)
        
    }

    func saveToFile(data: [String]) {
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)[0] as? NSURL {
            // get the document path
            
            let filePath = documentPath.URLByAppendingPathComponent("stringData.txt")
            // append file path to the document path
            
            let dataInCocoaArray:NSArray = data
            // conver the array into NSArray
            
            dataInCocoaArray.writeToURL(filePath, atomically: true)
            // save data
            
            println(dataInCocoaArray)
            println(data)
            
            
        }
        
        var successAlert = UIAlertController(title: "Success", message: "The data is saved!", preferredStyle: UIAlertControllerStyle.Alert)
        
        successAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(successAlert, animated: true, completion: nil)
            // display success message
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
