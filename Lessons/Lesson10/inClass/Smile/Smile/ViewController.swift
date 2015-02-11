//
//  ViewController.swift
//  Smile
//
//  Created by Bumhan Yu on 2/4/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var leftEye = UIView()
    var rightEye = UIView()
    var nose = UIView()
    var mouth = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        autolayout()
    }

    func autolayout() {
    
        
        leftEye.backgroundColor = UIColor.redColor()
        rightEye.backgroundColor = UIColor.blueColor()
        nose.backgroundColor = UIColor.brownColor()
        mouth.backgroundColor = UIColor.redColor()
        
        leftEye.setTranslatesAutoresizingMaskIntoConstraints(false)
        rightEye.setTranslatesAutoresizingMaskIntoConstraints(false)
        nose.setTranslatesAutoresizingMaskIntoConstraints(false)
        mouth.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.view.addSubview(leftEye)
        self.view.addSubview(rightEye)
        self.view.addSubview(nose)
        self.view.addSubview(mouth)
        
        self.view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 0.5,
            constant: 0
            ))
        
        self.view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 50
            ))
        
        self.view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50)
        )
    
        self.view.addConstraint(NSLayoutConstraint(
            item: leftEye,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 50)
            )
        
        self.view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: leftEye,
            attribute: .Width,
            multiplier: 1.0,
            constant: 0)
        )
        
        self.view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: leftEye,
            attribute: .Height,
            multiplier: 1.0,
            constant: 0)
        )
        
        self.view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: leftEye,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0)
        )
        self.view.addConstraint(NSLayoutConstraint(
            item: rightEye,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1.5,
            constant: 0)
        )
        
        self.view.addConstraint(NSLayoutConstraint(item: nose, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: nose, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 10))
        
        self.view.addConstraint(NSLayoutConstraint(item: nose, attribute: .Height, relatedBy: .Equal, toItem: leftEye, attribute: .Height, multiplier: 3, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: nose, attribute: .Top, relatedBy: .Equal, toItem: leftEye, attribute: .Bottom, multiplier: 1, constant: 0))

        
        
        
        self.view.addConstraint(NSLayoutConstraint(item: mouth, attribute: .Left, relatedBy: .Equal, toItem: leftEye, attribute: .Left, multiplier: 1, constant: 0))

        self.view.addConstraint(NSLayoutConstraint(item: mouth, attribute: .Right, relatedBy: .Equal, toItem: rightEye, attribute: .Right, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: mouth, attribute: .Height, relatedBy: .Equal, toItem: leftEye, attribute: .Height, multiplier: 0.5, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: mouth, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.5, constant: 0))
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "didTap"))

 //       leftEye.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"didTap"))
    }
//    
//    func didTap() {
//        centerY.constant = centerY.constant + 30
//
//        UIView.animateWithDuration(0.2, animations: { () -> Void in
//
//        })
//            // layoutIfNeeded updates the layout
//        
    
//    }
    
    func didTap() {
        
     //   self.view.backgroundColor = UIColor.grayColor()
        
        self.leftEye.backgroundColor = UIColor.purpleColor()
        self.rightEye.backgroundColor = UIColor.purpleColor()
        self.nose.backgroundColor = UIColor.purpleColor()
        self.mouth.backgroundColor = UIColor.purpleColor()

        UIView.animateWithDuration(2, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    
    }
    
    
    func springsAndStrutsLayout() {
        let topMargin:CGFloat = 50
        let eyeSize:CGFloat = 20
        
        var leftEye = UIView(frame: CGRect (x:self.view.frame.width/4, y:topMargin, width:eyeSize, height:eyeSize))
        var rightEye = UIView(frame: CGRect (x:self.view.frame.width*0.75-eyeSize, y:topMargin, width:eyeSize, height:eyeSize))
        
        var nose = UIView(frame: CGRect (x:self.view.frame.width/2, y: topMargin*1.5, width:10, height:40))
        
        let mouthWidth = CGRectGetMaxX(rightEye.frame) - CGRectGetMinX(leftEye.frame)
        
        var mouth = UIView(frame: CGRect (x:CGRectGetMinX(leftEye.frame), y: topMargin*4, width:mouthWidth, height:20))
        
        /// This doesn't make the eyes positioned relative to superview
        
        
        
        leftEye.backgroundColor = UIColor.purpleColor()
        rightEye.backgroundColor = UIColor.orangeColor()
        nose.backgroundColor = UIColor.redColor()
        mouth.backgroundColor = UIColor.redColor()
        
        leftEye.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin
        rightEye.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
        
        nose.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin
        mouth.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
        
        /// Autoresizing is only regarding the relationship between the view and its superview. No relationship between subviews within the superview
        
        self.view.addSubview(leftEye)
        self.view.addSubview(rightEye)
        self.view.addSubview(nose)
        self.view.addSubview(mouth)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

