//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        
        //////////////////////////////////////////
        //                                      //
        //       Homework code begins here      //
        //                                      //
        //////////////////////////////////////////

        var nav = self.navigationController?.navigationBar
        var navHeight = nav?.bounds.height
            // variables for navigation bar height
        
        var statusbarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
            // variable for status bar height
        
        var toolbarHeight = 44 as CGFloat
            // variable for toolbar height
        
        var squareSize = 20 as CGFloat
            // dimension for blue squares
        
        blueSquare1.backgroundColor = UIColor.blueColor()
        blueSquare2.backgroundColor = UIColor.blueColor()
        blueSquare3.backgroundColor = UIColor.blueColor()
        blueSquare4.backgroundColor = UIColor.blueColor()
            // Assign background color to each box
        
        self.exerciseView.addSubview(blueSquare1)
        self.exerciseView.addSubview(blueSquare2)
        self.exerciseView.addSubview(blueSquare3)
        self.exerciseView.addSubview(blueSquare4)
            // Add subview to exerciseView
        
        blueSquare1.frame = CGRect(
            x: 0,
            y: statusbarHeight+navHeight!,
            width: squareSize,
            height: squareSize)
        blueSquare2.frame = CGRect(
            x: CGRectGetMaxX(self.exerciseView.frame)-squareSize,
            y: statusbarHeight+navHeight!,
            width: squareSize,
            height: squareSize)
        blueSquare3.frame = CGRect(
            x: 0,
            y: CGRectGetMaxY(self.exerciseView.frame)-toolbarHeight-squareSize,
            width:squareSize,
            height:squareSize)
        blueSquare4.frame = CGRect(
            x: CGRectGetMaxX(self.exerciseView.frame)-squareSize,
            y: CGRectGetMaxY(self.exerciseView.frame)-toolbarHeight-squareSize,
            width: squareSize,
            height: squareSize)
        
        blueSquare1.autoresizingMask =
            UIViewAutoresizing.FlexibleRightMargin |
            UIViewAutoresizing.FlexibleBottomMargin |
            UIViewAutoresizing.FlexibleTopMargin
        blueSquare2.autoresizingMask =
            UIViewAutoresizing.FlexibleLeftMargin |
            UIViewAutoresizing.FlexibleBottomMargin |
            UIViewAutoresizing.FlexibleTopMargin
        blueSquare3.autoresizingMask =
            UIViewAutoresizing.FlexibleRightMargin |
            UIViewAutoresizing.FlexibleTopMargin
        blueSquare4.autoresizingMask =
            UIViewAutoresizing.FlexibleLeftMargin |
            UIViewAutoresizing.FlexibleTopMargin
    
    }

    var blueSquare1 = UIView() // top left
    var blueSquare2 = UIView() // top right
    var blueSquare3 = UIView() // bottom left
    var blueSquare4 = UIView() // bottom right
        // 1. Four variables are declared for the squares
        // 2. These are Class variables for public access from functions
    
    
    override func viewWillLayoutSubviews() {
//         AN ALTERNATIVE method, which gives more precise control
//         ... This function redraws the boxes each time the device orientation changes.
        
        var nav = self.navigationController?.navigationBar
        var navHeight = nav?.bounds.height
        // variables for navigation bar height

        var statusbarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        // variable for status bar height

        if UIInterfaceOrientationIsPortrait(self.interfaceOrientation)
        {
            blueSquare1.frame = CGRect(x: 0, y: statusbarHeight+navHeight!, width: 20, height: 20)
            blueSquare2.frame = CGRect(x: CGRectGetMaxX(self.exerciseView.frame)-20, y: 64, width: 20, height: 20)
            blueSquare3.frame = CGRect(x: 0, y: CGRectGetMaxY(self.exerciseView.frame)-64, width:20, height:20)
            blueSquare4.frame = CGRect(x: CGRectGetMaxX(self.exerciseView.frame)-20, y: CGRectGetMaxY(self.exerciseView.frame)-64, width: 20, height: 20)
            
        } else {
            blueSquare1.frame = CGRect(x: 0, y: 32, width: 20, height: 20)
            blueSquare2.frame = CGRect(x: CGRectGetMaxX(self.exerciseView.frame)-20, y: 32, width: 20, height: 20)
            blueSquare3.frame = CGRect(x: 0, y: CGRectGetMaxY(self.exerciseView.frame)-64, width:20, height:20)
            blueSquare4.frame = CGRect(x: CGRectGetMaxX(self.exerciseView.frame)-20, y: CGRectGetMaxY(self.exerciseView.frame)-64, width: 20, height: 20)
        }
    }   // This will determine device orientation and adjust Springs & Struts accordingly, so that each box remains in the same position.
    
        //////////////////////////////////////////
        //                                      //
        //       Homework code ends here        //
        //                                      //
        //////////////////////////////////////////

    
    override func shouldAutorotate() -> Bool {

        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
