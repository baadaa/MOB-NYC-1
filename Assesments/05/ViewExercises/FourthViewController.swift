//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        /* TODO:
        Build a scroll view that takes up the entire screen. 
        
        In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen, a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view.
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
 
        
        var scrollView = UIScrollView()
        
        var containerView = UIView()
        var blueBox = UIView()
        var purpleLabel = UILabel()
        var redBox = UIView()
            // declare scroll view and its contained elements as variables
        
        scrollView.scrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
//        scrollView.backgroundColor = UIColor.yellowColor()
            // test out scrollView background color to visualize its subview positions
        
        blueBox.backgroundColor = UIColor.blueColor()
        purpleLabel.backgroundColor = UIColor.purpleColor()
        redBox.backgroundColor = UIColor.redColor()
            // setting the background colors
        
        containerView.frame = CGRect(x:0, y:0, width: self.exerciseView.frame.width, height: 1040)
            // This is a view that sits in scrollview and then contains all subviews to anchor them in proper positions.
        
        scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        blueBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        redBox.setTranslatesAutoresizingMaskIntoConstraints(false)
            // set AutoresizingMask translation to false for all
        
        self.exerciseView.addSubview(scrollView)
            // add elements into scrollView, and add scrollView into exerciseView
        
        self.exerciseView.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Top, multiplier: 1, constant: navHeight!+statusbarHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Left, multiplier: 1, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1, constant: -toolbarHeight))
        
        scrollView.contentSize = containerView.bounds.size
            // constraints for scrollView

        scrollView.addSubview(containerView)
            // containerView is added to scrollView
        
        containerView.addSubview(blueBox)
            // blueBox is added to containerView

        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20))
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1, constant: 10))
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1, constant: -10))
            // contraints for blueBox
        
        containerView.addSubview(purpleLabel)
            // purpleLabel is added to containerView
        
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Top, relatedBy: .Equal, toItem: blueBox, attribute: .Bottom, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 1000))
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1, constant: 0))
        
        purpleLabel.text = "This is some text in Purple Label."
        purpleLabel.textColor = UIColor.whiteColor()
        purpleLabel.textAlignment = NSTextAlignment.Center
            // constraints and properties of purpleLabel
        
        containerView.addSubview(redBox)
        // blueBox is added to containerView
        
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Top, relatedBy: .Equal, toItem: purpleLabel, attribute: .Bottom, multiplier: 1, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1, constant: 10))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1, constant: -10))
        // contraints for redBox
        
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}
