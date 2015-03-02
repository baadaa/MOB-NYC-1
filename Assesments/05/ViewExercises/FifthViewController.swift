//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {

    
    //////////////////////////////////////////
    //                                      //
    //       Homework code begins here      //
    //                                      //
    //////////////////////////////////////////
    
    var buttonYaxis:NSLayoutConstraint?
        // Declared as Class variable for accessing dynamically in code to change the button position
    
    
    
    
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

    
        var buttonSize = 50 as CGFloat
            // variable for the button
        
        var greenButton = UIButton()
        
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.layer.cornerRadius = 5
        greenButton.layer.borderColor = UIColor.redColor().CGColor
        greenButton.layer.borderWidth = 1.0
        greenButton.enabled = true

        greenButton.setTitle("Tap me!", forState: UIControlState.Normal)
        greenButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        greenButton.titleLabel?.adjustsFontSizeToFitWidth = true
            // Basic properties of button item
        
        greenButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        self.exerciseView.addSubview(greenButton)

        buttonYaxis = NSLayoutConstraint(item: greenButton, attribute: .CenterY, relatedBy: .Equal, toItem: exerciseView, attribute: .CenterY, multiplier: 1, constant: 0)
        
        if let buttonYconstraint = buttonYaxis {
            self.exerciseView.addConstraint(buttonYconstraint)
        }
        
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .CenterX, relatedBy: .Equal, toItem: exerciseView, attribute: .CenterX, multiplier: 1, constant: 0))
        
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonSize))
        exerciseView.addConstraint(NSLayoutConstraint(item: greenButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonSize))

    
        greenButton.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func buttonTapped(sender: UIButton) {
        
        println("button is tapped")

        UIView.animateWithDuration(1, animations: { () -> Void in
            sender.enabled = false
            sender.backgroundColor = UIColor.redColor()
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            self.buttonYaxis?.constant = -20
            self.exerciseView.layoutIfNeeded()
                // adjust Y-positioning of the button while the button disabled
            
        }) { (completed) -> Void in
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                sender.backgroundColor = UIColor.greenColor()
                sender.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                self.buttonYaxis?.constant = 0
                self.exerciseView.layoutIfNeeded()
                    // adjust Y-positioning of the button back to its orinal location
                
            }, completion: { (completed) -> Void in
                sender.enabled = true
                    // when animation cycle of up and down is over, button is back enabled.
            })
        }
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
