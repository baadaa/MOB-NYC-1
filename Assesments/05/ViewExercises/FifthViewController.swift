//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
        Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.
        
        Use Autolayout.
        
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
        
        var greenButton = UIButton()
        var buttonSize = 50 as CGFloat
            // variable for the button
        
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.layer.cornerRadius = 5
        
        greenButton.setTranslatesAutoresizingMaskIntoConstraints(false)
            // 
        self.exerciseView.addSubview(greenButton)
        
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .CenterX, relatedBy: .Equal, toItem: exerciseView, attribute: .CenterX, multiplier: 1, constant: 0))
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .CenterY, relatedBy: .Equal, toItem: exerciseView, attribute: .CenterY, multiplier: 1, constant: 0))
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonSize))
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonSize))

    
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
