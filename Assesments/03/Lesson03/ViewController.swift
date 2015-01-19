//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    TODO one: Hook up a swipeable area on the home screen that must present a modal dialog when swiped. You must create the modal dialog and present it in CODE (not the storyboard).
    */
    
    @IBAction func didSwipeHorizontally(sender: AnyObject) {
        performSegueWithIdentifier("swipeSegue", sender: nil)
        
    }
    
    // Both left- and right-swipe recognizers are added to IB in storyboard, which detect horizontal swipes and call this function.
    //------------------------------

    
    
    
    /*
    TODO two: Add an imageview to the modal dialog presented in TODO two.
    */

    // An Image View is added to IB, and a photograph of universe is assigned to it.
    
    //------------------------------
    
    
    
    
    
    /*
    TODO three: Add and hook up a ‘dismiss’ button below the above mentioned image view that will dismiss the modal dialog. Do this in CODE.
    */
    
    @IBAction func dismissButtonIsTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //------------------------------
    
    
    
    
    
    /* 
    TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */

    @IBAction func displayTableViewButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("show", sender: nil)
        
    }
    
    
    
    
    
}

