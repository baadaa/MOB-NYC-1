//
//  FirstViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FirstViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")

        /* TODO:
        Create a red box (10px tall, the width of the screen) with a black border on the very top of the screen below the nav bar,
        and a black box with a red border on the very bottom of the screen (same dimensions), above the toolbar.
        
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

        var redBox = UIView()
        var blackBox = UIView()
            // variables declared for two boxes
        
        var boxHeight = 10 as CGFloat
            // height for both boxes
        
        redBox.frame = CGRect(
            x:0,
            y:navHeight!+statusbarHeight,
            width:CGRectGetMaxX(self.exerciseView.frame),
            height:boxHeight)
        blackBox.frame = CGRect(
            x: 0,
            y: CGRectGetMaxY(self.exerciseView.frame)-toolbarHeight-boxHeight,
            width: CGRectGetMaxX(self.exerciseView.frame),
            height: boxHeight)
            // frames are set for both boxes, using Springs and Struts.
            //      1. Y-position for redBox is set to accomodate status bar and navigation bar heights
            //      2. Y-position for blackBox is set to accomodate the toolbar on the bottom: 44 points of UIToolbar height and 10 points of the box height itself
        
        redBox.backgroundColor = UIColor.redColor()
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.layer.borderWidth = 1
        blackBox.layer.borderColor = UIColor.redColor().CGColor
            // set background colors and border properties to boxes
        
        self.exerciseView.addSubview(redBox)
        self.exerciseView.addSubview(blackBox)
            // Two colored boxes are added to exerciseView
        
        
        //////////////////////////////////////////
        //                                      //
        //       Homework code ends here        //
        //                                      //
        //////////////////////////////////////////

    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func next() {
        self.performSegueWithIdentifier("two", sender: nil)
    }
}
