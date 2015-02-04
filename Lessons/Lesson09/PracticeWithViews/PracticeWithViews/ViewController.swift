//
//  ViewController.swift
//  PracticeWithViews
//
//  Created by Bumhan Yu on 2/2/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var username = UITextField(frame: CGRect(x: 50, y: 50, width: 200, height: 30))
    var password = UITextField(frame: CGRect(x: 50, y: 90, width: 200, height:30))
    var loginBtn = UIButton(frame: CGRect(x: 50, y:130, width:200, height:30))
    var messageLabel = UILabel (frame: CGRect(x: 20, y:200, width:280, height:30))
    var container = UIView(frame: CGRect(x:0, y:0, width:UIScreen.mainScreen().bounds.width, height:UIScreen.mainScreen().bounds.height))

    var successView = UIView(frame: CGRect(x: 0, y:0, width:UIScreen.mainScreen().bounds.width, height:UIScreen.mainScreen().bounds.height))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        username.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
        username.placeholder = "Enter Username"
        username.keyboardType = UIKeyboardType.EmailAddress

        password.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.2)
        password.placeholder = "Enter Password"
        password.keyboardType = UIKeyboardType.Default

        loginBtn.backgroundColor = UIColor.greenColor()
        loginBtn.setTitle("LOGIN", forState: UIControlState.Normal)
        loginBtn.addTarget(self, action: "loginButtonTapped", forControlEvents: UIControlEvents.TouchUpInside)

        messageLabel.backgroundColor = UIColor.grayColor()
        
        successView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.1)
        
        self.view.addSubview(container)
        
        container.addSubview(username)
        container.addSubview(password)
        container.addSubview(loginBtn)
        container.addSubview(messageLabel)
        
        
    }
    
    // NOTE: http://webindream.com/how-to-customise-uitextfield-swift/
    

    func loginButtonTapped() {
//        UIView.animateWithDuration(0.2, animations: { () -> Void in
//            self.loginBtn.frame.origin.y = self.loginBtn.frame.origin.y + 20
//        })
      //  self.view.addSubview(successView)
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.successView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.9)
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

