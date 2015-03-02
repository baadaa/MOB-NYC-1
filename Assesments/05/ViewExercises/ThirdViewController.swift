//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ThirdViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        
        //////////////////////////////////////////
        //                                      //
        //       Homework code begins here      //
        //                                      //
        //////////////////////////////////////////
        
        // INCOMPLETE: figure out how to accommodate statusbar height in horizontal orientation

        var nav = self.navigationController?.navigationBar
        var navHeight = nav?.bounds.height
            // variables for navigation bar height
        
        var statusbarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
            // variable for status bar height
        
        var toolbarHeight = 44 as CGFloat
            // variable for toolbar height
        
        var squareSize = 20 as CGFloat
            // dimension for squares
        
        var blueSquare1 = UIView()  // top-left
        var blueSquare2 = UIView()  // top-right
        var blueSquare3 = UIView()    // bottom-left
        var blueSquare4 = UIView()    // bottom-right
            // declare four squares
        
        blueSquare1.backgroundColor = UIColor.blueColor()
        blueSquare2.backgroundColor = UIColor.blueColor()
        blueSquare3.backgroundColor = UIColor.blueColor()
        blueSquare4.backgroundColor = UIColor.blueColor()
            // assign background colors
        
        blueSquare1.setTranslatesAutoresizingMaskIntoConstraints(false)
        blueSquare2.setTranslatesAutoresizingMaskIntoConstraints(false)
        blueSquare3.setTranslatesAutoresizingMaskIntoConstraints(false)
        blueSquare4.setTranslatesAutoresizingMaskIntoConstraints(false)
            // set AutoresizingMask to false
        
        self.exerciseView.addSubview(blueSquare1)
        self.exerciseView.addSubview(blueSquare2)
        self.exerciseView.addSubview(blueSquare3)
        self.exerciseView.addSubview(blueSquare4)
            // add subviews to exerciseView
        
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare1,
            attribute: NSLayoutAttribute.Left,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Left,
            multiplier: 1,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: blueSquare1,
            attribute: NSLayoutAttribute.Top,
            relatedBy: .Equal,
            toItem: self.topLayoutGuide,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare1,
            attribute: NSLayoutAttribute.Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare1,
            attribute: NSLayoutAttribute.Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
                // Constraints for top-left square
        
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare2,
            attribute: NSLayoutAttribute.Right,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Right,
            multiplier: 1,
            constant: 0))
        self.view.addConstraint(NSLayoutConstraint(
            item: blueSquare2,
            attribute: NSLayoutAttribute.Top,
            relatedBy: .Equal,
            toItem: self.topLayoutGuide,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare2,
            attribute: NSLayoutAttribute.Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare2,
            attribute: NSLayoutAttribute.Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
                // Constraints for top-right square
        
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare3,
            attribute: NSLayoutAttribute.Left,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Left,
            multiplier: 1,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare3,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Bottom,
            multiplier: 1,
            constant: -toolbarHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare3,
            attribute: NSLayoutAttribute.Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare3,
            attribute: NSLayoutAttribute.Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
                // Constraints for bottom-left square
        
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare4,
            attribute: NSLayoutAttribute.Right,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Right,
            multiplier: 1,
            constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare4,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: .Equal,
            toItem: self.exerciseView,
            attribute: .Bottom,
            multiplier: 1,
            constant: -toolbarHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare4,
            attribute: NSLayoutAttribute.Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
        self.exerciseView.addConstraint(NSLayoutConstraint(
            item: blueSquare4,
            attribute: NSLayoutAttribute.Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: squareSize))
                // Constraints for bottom-right square
        
        //////////////////////////////////////////
        //                                      //
        //       Homework code ends here        //
        //                                      //
        //////////////////////////////////////////

    }
    
    override func shouldAutorotate() -> Bool {

        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }

}
