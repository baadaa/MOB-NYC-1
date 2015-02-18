//
//  ViewController.swift
//  Calculator
//
//  Created by Bumhan Yu on 2/15/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawInterface()
            // prepare the UI elements
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func drawInterface() {
        var statusbarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        var viewHeight = self.view.frame.height - statusbarHeight
        var viewWidth = self.view.frame.width
        
        var keyPadHeight = viewHeight/7*5
        
        var buttonHeight = keyPadHeight/5
        var buttonWidth = viewWidth/4
        
        let numberKeyColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha:1)
        let calcKeyColor = UIColor.orangeColor()
        let auxKeyColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
        
        var bg = UIView()
        var keyPad = UIView()
        
        var button1 = UIButton()
        var button2 = UIButton()
        var button3 = UIButton()
        var button4 = UIButton()
        var button5 = UIButton()
        var button6 = UIButton()
        var button7 = UIButton()
        var button8 = UIButton()
        var button9 = UIButton()
        var button0 = UIButton()
        var buttonPlus = UIButton()
        var buttonMinus = UIButton()
        var buttonMultiply = UIButton()
        var buttonDivide = UIButton()
        var buttonPercent = UIButton()
        var buttonInverse = UIButton()
        var buttonEqual = UIButton()
        var buttonDecimal = UIButton()
        var buttonAC = UIButton()
        var buttonEdit = UIButton()

        button0.layer.borderWidth = 0.5
        button0.layer.borderColor = UIColor.blackColor().CGColor
        
        bg.backgroundColor = UIColor(red: 0.2, green: 0.1, blue: 0.1, alpha: 1)
        bg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        keyPad.backgroundColor = UIColor.orangeColor()
        keyPad.setTranslatesAutoresizingMaskIntoConstraints(false)

        button0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button0.setTitle("0", forState: .Normal)
        button1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button1.setTitle("1", forState: .Normal)
        button2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button2.setTitle("2", forState: .Normal)
        button3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button3.setTitle("3", forState: .Normal)
        button4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button4.setTitle("4", forState: .Normal)
        button5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button5.setTitle("5", forState: .Normal)
        button6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button6.setTitle("6", forState: .Normal)
        button7.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button7.setTitle("7", forState: .Normal)
        button8.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button8.setTitle("8", forState: .Normal)
        button9.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button9.setTitle("9", forState: .Normal)
        
        button0.backgroundColor = numberKeyColor
        button1.backgroundColor = numberKeyColor
        button2.backgroundColor = numberKeyColor
        button3.backgroundColor = numberKeyColor
        button4.backgroundColor = numberKeyColor
        button5.backgroundColor = numberKeyColor
        button6.backgroundColor = numberKeyColor
        button7.backgroundColor = numberKeyColor
        button8.backgroundColor = numberKeyColor
        button9.backgroundColor = numberKeyColor
        
        buttonPlus.titleLabel?.text = "+"
        buttonMinus.titleLabel?.text = "-"
        buttonMultiply.titleLabel?.text = "*"
        buttonDivide.titleLabel?.text = "/"
        buttonEqual.titleLabel?.text = "="
        
        buttonPlus.backgroundColor = calcKeyColor
        buttonMinus.backgroundColor = calcKeyColor
        buttonMultiply.backgroundColor = calcKeyColor
        buttonDivide.backgroundColor = calcKeyColor
        buttonEqual.backgroundColor = calcKeyColor
        
        buttonPercent.titleLabel?.text = "%"
        buttonAC.titleLabel?.text = "AC"
        buttonEdit.titleLabel?.text = "EDIT"
        buttonDecimal.titleLabel?.text = "."

        buttonPercent.backgroundColor = auxKeyColor
        buttonAC.backgroundColor = auxKeyColor
        buttonEdit.backgroundColor = auxKeyColor
        buttonDecimal.backgroundColor = auxKeyColor

        
        button0.setTranslatesAutoresizingMaskIntoConstraints(false)
        button1.setTranslatesAutoresizingMaskIntoConstraints(false)
        button2.setTranslatesAutoresizingMaskIntoConstraints(false)
        button3.setTranslatesAutoresizingMaskIntoConstraints(false)
        button4.setTranslatesAutoresizingMaskIntoConstraints(false)
        button5.setTranslatesAutoresizingMaskIntoConstraints(false)
        button6.setTranslatesAutoresizingMaskIntoConstraints(false)
        button7.setTranslatesAutoresizingMaskIntoConstraints(false)
        button8.setTranslatesAutoresizingMaskIntoConstraints(false)
        button9.setTranslatesAutoresizingMaskIntoConstraints(false)

        buttonPlus.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonMinus.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonMultiply.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonDivide.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonEqual.setTranslatesAutoresizingMaskIntoConstraints(false)

        self.view.addSubview(bg)
        
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: 0))

    
        bg.addSubview(keyPad)
        
        bg.addConstraint(NSLayoutConstraint(item: keyPad, attribute: .Bottom, relatedBy: .Equal, toItem: bg, attribute: .Bottom, multiplier: 1, constant: 0))
        bg.addConstraint(NSLayoutConstraint(item: keyPad, attribute: .Width, relatedBy: .Equal, toItem: bg, attribute: .Width, multiplier: 1, constant: 0))
        bg.addConstraint(NSLayoutConstraint(item: keyPad, attribute:.Height, relatedBy: .Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: keyPadHeight))
        
        keyPad.addSubview(button0)
        keyPad.addSubview(button1)
        keyPad.addSubview(button2)
        keyPad.addSubview(button3)
        keyPad.addSubview(button4)
        keyPad.addSubview(button5)
        keyPad.addSubview(button6)
        keyPad.addSubview(button7)
        keyPad.addSubview(button8)
        keyPad.addSubview(button9)

        keyPad.addSubview(buttonPlus)
        keyPad.addSubview(buttonMinus)
        keyPad.addSubview(buttonMultiply)
        keyPad.addSubview(buttonDivide)
        keyPad.addSubview(buttonEqual)

        keyPad.addSubview(buttonPercent)
        keyPad.addSubview(buttonDecimal)
        keyPad.addSubview(buttonAC)
        keyPad.addSubview(buttonEdit)

        keyPad.addConstraint(NSLayoutConstraint(item: button0, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button0, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button0, attribute: .Left, relatedBy: .Equal, toItem: keyPad, attribute: .Left, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button0, attribute: .Bottom, relatedBy: .Equal, toItem: keyPad, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button1, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button1, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button1, attribute: .Left, relatedBy: .Equal, toItem: keyPad, attribute: .Left, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button1, attribute: .Bottom, relatedBy: .Equal, toItem: button0, attribute: .Top, multiplier: 1, constant: 0))

        keyPad.addConstraint(NSLayoutConstraint(item: button4, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button4, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button4, attribute: .Left, relatedBy: .Equal, toItem: keyPad, attribute: .Left, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button4, attribute: .Bottom, relatedBy: .Equal, toItem: button1, attribute: .Top, multiplier: 1, constant: 0))
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }

}

