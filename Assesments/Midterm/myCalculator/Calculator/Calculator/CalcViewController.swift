//
//  ViewController.swift
//  Calculator
//
//  Created by Bumhan Yu on 2/15/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    var bg = UIView()
    var keyPad = UIView()
    var displayArea = UIView()
        // input and output modules
    
    var prevNum = UILabel()
    var operatorSign = UILabel()
    var messageBoard = UILabel()
    var currentNum = UILabel()
        // output text labels

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
        // Number buttons
    var buttonPlus = UIButton()
    var buttonMinus = UIButton()
    var buttonMultiply = UIButton()
    var buttonDivide = UIButton()
        // Calculation buttons
    var buttonPercent = UIButton()
    var buttonInverse = UIButton()
    var buttonEqual = UIButton()
    var buttonDecimal = UIButton()
    var buttonAC = UIButton()
    var buttonEdit = UIButton()
        // Function buttons

    var isDecimal = false
    var isNegative = false
        // Booleans to check decimal or/and negativity
    
    var decimalDigit = 0
    var wholeDigit = 1
        // This is to track digits before and after decimal point
    
    var lastTappedKey:String = ""
    var lastTappedOperator:String = ""
    var lastTappedNumber:String = ""
        // Track the last tapped keys
    
    var calcResult:Double = 0
        // Variable for calculation results
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawInterface()
            // prepare the UI elements
        
        receiveInput()
            // start receiving keypad input
        
    }

    func receiveInput () {
        button0.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button1.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button2.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button3.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button4.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button5.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button6.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button7.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button8.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button9.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonDecimal.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonInverse.addTarget(self, action: "numberTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        buttonAC.addTarget(self, action: "functionKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonEdit.addTarget(self, action: "functionKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        buttonPlus.addTarget(self, action: "calcKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonEqual.addTarget(self, action: "calcKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func numberTapped(sender: UIButton) {
        
        if wholeDigit > 9 {
            return
        }   // limit number input size
        println(wholeDigit)
        
        if let tappedNumber = sender.currentTitle {
            
            switch tappedNumber {
            case "0":
                if isDecimal == true {
                    decimalDigit += 1
                    if decimalDigit > 4 {
                        decimalDigit = 4
                        break
                    }
                }
                if currentNum.text == "0" {
                    break
                } else {
                    currentNum.text = currentNum.text! + "0"
                    wholeDigit += 1
                }
                break

            case ".":
                if isDecimal == true {
                    break
                } else {
                    isDecimal = true
                    currentNum.text = currentNum.text! + "."
                }
                break
                
            case "+/-":
                if isNegative == true {
                    var totalDigit = countElements(currentNum.text!)
                    var updatedNum = currentNum.text!.substringFromIndex(advance(currentNum.text!.endIndex, -(totalDigit-1)))
                    currentNum.text = updatedNum
                    isNegative = false
                    break
                        // If negative number, remove the "-" character at the beginning of the string and set it to positive
                } else {
                    isNegative = true
                    currentNum.text = "-" + currentNum.text!
                        // If positive number, add "-" character at the beginning of the string and set it to negative
                    break
                }

            default:
                
                if isDecimal == true {
                    decimalDigit += 1
                    if decimalDigit > 4 {
                        decimalDigit = 4
                        break
                    }
                } else {
                    wholeDigit += 1
                }

                if currentNum.text == "0" {
                    currentNum.text = tappedNumber
                } else if currentNum.text == "-0" {
                    currentNum.text = "-" + tappedNumber
                } else {
                    currentNum.text = currentNum.text! + tappedNumber
                }
                break
                
                
            
            }
            
            lastTappedKey = tappedNumber
            lastTappedNumber = tappedNumber

            
        }
        ///// NOTE: currentNum (UILabel), which displays the latest calculation result or current input, always has some value. Thus, force-unwrapping the optional value here is not a concern.
    }
    
    
    func functionKeyTapped(sender: UIButton) {

        var totalDigit = countElements(currentNum.text!)
            // count the length of current number, including decimal and pos/neg sign

        if let tappedFunction = sender.currentTitle {
            
            switch tappedFunction {
            case "AC":
                currentNum.text = "0"
                prevNum.text = ""
                operatorSign.text = ""
                messageBoard.text = ""
                isDecimal = false
                isNegative = false
                decimalDigit = 0
                wholeDigit = 1
                break
            case "DELETE":
                if totalDigit == 1 {
                    currentNum.text = "0"
                    wholeDigit = 1
                    decimalDigit = 0
                } else {
                    var updatedNum = currentNum.text!.substringToIndex(advance(currentNum.text!.startIndex, totalDigit-1))
                        // remove the last character from string
                    
                    var lastCharacter = updatedNum[advance(updatedNum.endIndex, -1)]
                        // get the last character of the string
                    
                    if lastCharacter == "-" {
                        updatedNum = "0"
                        isDecimal = false
                        isNegative = false
                        wholeDigit = 1
                        decimalDigit = 0
                    } else if lastCharacter == "." {
                        updatedNum = updatedNum.substringToIndex(advance(currentNum.text!.startIndex, totalDigit-2))
                        isDecimal = false
                        decimalDigit = 0
                        
                        // If the last character of the string is ".", remove it from the string as well.
                    }
                    
                    currentNum.text = updatedNum
                    
                    if isDecimal == true {
                        decimalDigit -= 1
                    } else {
                        wholeDigit -= 1
                        if wholeDigit < 1 { wholeDigit = 1 }
                    }
                }
                println(wholeDigit)
            default:
                break
            }
        
        lastTappedKey = tappedFunction
            
        }
        

    }

    func calcKeyTapped(sender: UIButton) {
        
        var currentNumForCalc = (currentNum.text! as NSString).doubleValue
        
        if let tappedCalc = sender.currentTitle {
            
            if prevNum.text == "" {
                prevNum.text = currentNum.text!
                operatorSign.text = tappedCalc
                currentNum.text = "0"
                wholeDigit = 1
                lastTappedKey = tappedCalc
                lastTappedOperator = tappedCalc
                return
            }
                // if it's a beginning of a new calculation, simply update the display and do not perform any calculation yet.
            
            func performCalculation (calcType:String) -> (String) {
                var existingNumForCalc = (prevNum.text! as NSString).doubleValue
                switch calcType {
                    case "+":
                        calcResult = currentNumForCalc + existingNumForCalc
                        break
                    case "-":
                        calcResult = currentNumForCalc - existingNumForCalc
                        break
                    case "/":
                        if currentNumForCalc == 0 {
                            messageBoard.text = "You cannot divide by zero!"
                            break
                        }
                        calcResult = currentNumForCalc / existingNumForCalc
                        break
                    case "*":
                        calcResult = currentNumForCalc * existingNumForCalc
                        break
                    default:
                        break
                }
                    // This is a simple function that carries out the arithmetic and returns the result in string
                
                var tempCalcResult = toString(calcResult)
                var tempCalcResultLength = countElements(tempCalcResult)
                
                if calcResult - floor(calcResult) < 0.00001 {
                    tempCalcResult = tempCalcResult.substringToIndex(advance(tempCalcResult.startIndex, tempCalcResultLength-2))
                } // if the results is a whole number, remove decimal point
                
                return tempCalcResult

            } // performCalculation func closed 
            
            
            switch tappedCalc {
                
            case "+":
                
                if lastTappedKey == "=" {
                    operatorSign.text = tappedCalc
                    prevNum.text = currentNum.text!
                    currentNum.text = "0"
                    wholeDigit = 1
                    isDecimal = false
                    lastTappedOperator = "+"
                    lastTappedKey = "+"
                    return
                }
                
                if lastTappedKey == "+" || lastTappedKey == "-" || lastTappedKey == "*" || lastTappedKey == "/" {
                    return
                }
                    // This if statement is to prevent glitches when user keeps tapping operator buttons more than a single time
                
                prevNum.text = performCalculation(tappedCalc)
                
                operatorSign.text = " + "
                currentNum.text = "0"
                decimalDigit = 0
                wholeDigit = 1
                isDecimal = false
                lastTappedOperator = tappedCalc
                lastTappedKey = tappedCalc
                
            case "=":
                
                if lastTappedKey == "=" {
                
                }
                
                prevNum.text = prevNum.text! + " " + operatorSign.text! + " " + currentNum.text!
                currentNum.text = performCalculation(lastTappedOperator)
                
                lastTappedKey = tappedCalc
                lastTappedOperator = ""
                
                operatorSign.text = " = "
                decimalDigit = 0
                wholeDigit = 1
                isDecimal = false
                break
                
            default:
                break
            }
            
        }
    }
        
    func drawInterface() {
        
            // This function draws interface elements--i.e. number displays, message board and buttons in AutoLayout. The elements account for width and height of the device, as well as the status bar height, and draws the UI elements in relative proportion. This approach allows room for various devices--e.g. iPhone4, iPhone 5s, iPhone 6...
        
        
        var statusbarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        var viewHeight = self.view.frame.height - statusbarHeight
        var viewWidth = self.view.frame.width
        var lengthUnit = viewHeight/7
            // Determine basic UI size units for drawing
        
        var keyPadHeight = lengthUnit*5
        var displayHeight = lengthUnit*2
        var buttonHeight = lengthUnit
        var buttonWidth = viewWidth/4
            // Total height of keyPad is 5/7 of device height
            // Height of each button is 1/7 of device height
            // Width of each button is 1/4 of device width
        
        
        let numberKeyColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha:1)
        let calcKeyColor = UIColor.orangeColor()
        let auxKeyColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
            // Each button is color-coded per its function: light gray for number keys, mid gray for function keys, and orange for calculation keys.
            // These colors can be updated per necessary here.
        
        
        prevNum.textColor = UIColor.whiteColor()
        operatorSign.textColor = UIColor.whiteColor()
        messageBoard.textColor = UIColor.whiteColor()
        currentNum.textColor = UIColor.whiteColor()
        
        prevNum.text = ""
        operatorSign.text = ""
        messageBoard.text = ""
        currentNum.text = "0"
        
        prevNum.textAlignment = NSTextAlignment.Right
        operatorSign.textAlignment = NSTextAlignment.Right
        messageBoard.textAlignment = NSTextAlignment.Center
        currentNum.textAlignment = NSTextAlignment.Right
        
        currentNum.font = UIFont.systemFontOfSize(90)
        currentNum.adjustsFontSizeToFitWidth = true
        

        button0.layer.borderWidth = 0.5
        button0.layer.borderColor = UIColor.blackColor().CGColor
        button1.layer.borderWidth = 0.5
        button1.layer.borderColor = UIColor.blackColor().CGColor
        button2.layer.borderWidth = 0.5
        button2.layer.borderColor = UIColor.blackColor().CGColor
        button3.layer.borderWidth = 0.5
        button3.layer.borderColor = UIColor.blackColor().CGColor
        button4.layer.borderWidth = 0.5
        button4.layer.borderColor = UIColor.blackColor().CGColor
        button5.layer.borderWidth = 0.5
        button5.layer.borderColor = UIColor.blackColor().CGColor
        button6.layer.borderWidth = 0.5
        button6.layer.borderColor = UIColor.blackColor().CGColor
        button7.layer.borderWidth = 0.5
        button7.layer.borderColor = UIColor.blackColor().CGColor
        button8.layer.borderWidth = 0.5
        button8.layer.borderColor = UIColor.blackColor().CGColor
        button9.layer.borderWidth = 0.5
        button9.layer.borderColor = UIColor.blackColor().CGColor
        
        buttonPlus.layer.borderWidth = 0.5
        buttonPlus.layer.borderColor = UIColor.blackColor().CGColor
        buttonMinus.layer.borderWidth = 0.5
        buttonMinus.layer.borderColor = UIColor.blackColor().CGColor
        buttonMultiply.layer.borderWidth = 0.5
        buttonMultiply.layer.borderColor = UIColor.blackColor().CGColor
        buttonDivide.layer.borderWidth = 0.5
        buttonDivide.layer.borderColor = UIColor.blackColor().CGColor
        buttonEqual.layer.borderWidth = 0.5
        buttonEqual.layer.borderColor = UIColor.blackColor().CGColor
        
        buttonInverse.layer.borderWidth = 0.5
        buttonInverse.layer.borderColor = UIColor.blackColor().CGColor
        buttonDecimal.layer.borderWidth = 0.5
        buttonDecimal.layer.borderColor = UIColor.blackColor().CGColor
        buttonAC.layer.borderWidth = 0.5
        buttonAC.layer.borderColor = UIColor.blackColor().CGColor
        buttonEdit.layer.borderWidth = 0.5
        buttonEdit.layer.borderColor = UIColor.blackColor().CGColor
        buttonPercent.layer.borderWidth = 0.5
        buttonPercent.layer.borderColor = UIColor.blackColor().CGColor
            // Set border property of all buttons
        

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
        
        buttonPlus.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonPlus.setTitle("+", forState: .Normal)
        buttonMinus.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonMinus.setTitle("-", forState: .Normal)
        buttonMultiply.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonMultiply.setTitle("*", forState: .Normal)
        buttonDivide.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonDivide.setTitle("/", forState: .Normal)
        buttonEqual.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonEqual.setTitle("=", forState: .Normal)
        
        buttonInverse.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonInverse.setTitle("+/-", forState: .Normal)
        buttonDecimal.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonDecimal.setTitle(".", forState: .Normal)
        buttonAC.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonAC.setTitle("AC", forState: .Normal)
        buttonEdit.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonEdit.setTitle("DELETE", forState: .Normal)
        buttonPercent.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonPercent.setTitle("%", forState: .Normal)
            // Set title for all buttons
        

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
        
        buttonPlus.backgroundColor = calcKeyColor
        buttonMinus.backgroundColor = calcKeyColor
        buttonMultiply.backgroundColor = calcKeyColor
        buttonDivide.backgroundColor = calcKeyColor
        buttonEqual.backgroundColor = calcKeyColor
        
        buttonPercent.backgroundColor = auxKeyColor
        buttonAC.backgroundColor = auxKeyColor
        buttonEdit.backgroundColor = auxKeyColor
        buttonDecimal.backgroundColor = auxKeyColor
        buttonInverse.backgroundColor = auxKeyColor
            // Set color for all buttons
        
        
        bg.backgroundColor = UIColor(red: 0.2, green: 0.1, blue: 0.1, alpha: 1)
        bg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        keyPad.backgroundColor = UIColor.orangeColor()
        keyPad.setTranslatesAutoresizingMaskIntoConstraints(false)

        displayArea.setTranslatesAutoresizingMaskIntoConstraints(false)

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

        buttonInverse.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonDecimal.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonPercent.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonAC.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonEdit.setTranslatesAutoresizingMaskIntoConstraints(false)

        self.view.addSubview(bg)
        
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: bg, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: 0))

    
        bg.addSubview(keyPad)
        bg.addSubview(displayArea)
        
        bg.addConstraint(NSLayoutConstraint(item: keyPad, attribute: .Bottom, relatedBy: .Equal, toItem: bg, attribute: .Bottom, multiplier: 1, constant: 0))
        bg.addConstraint(NSLayoutConstraint(item: keyPad, attribute: .Width, relatedBy: .Equal, toItem: bg, attribute: .Width, multiplier: 1, constant: 0))
        bg.addConstraint(NSLayoutConstraint(item: keyPad, attribute:.Height, relatedBy: .Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: keyPadHeight))
        
        bg.addConstraint(NSLayoutConstraint(item: displayArea, attribute:.Width, relatedBy: .Equal, toItem: bg, attribute: .Width, multiplier: 1, constant: 0))
        bg.addConstraint(NSLayoutConstraint(item: displayArea, attribute: .Bottom, relatedBy: .Equal, toItem: keyPad, attribute: .Top, multiplier: 1, constant: 0))
        bg.addConstraint(NSLayoutConstraint(item: displayArea, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: displayHeight))
        
        displayArea.addSubview(prevNum)
        displayArea.addSubview(operatorSign)
        displayArea.addSubview(messageBoard)
        displayArea.addSubview(currentNum)
        
        prevNum.setTranslatesAutoresizingMaskIntoConstraints(false)
        operatorSign.setTranslatesAutoresizingMaskIntoConstraints(false)
        messageBoard.setTranslatesAutoresizingMaskIntoConstraints(false)
        currentNum.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        displayArea.addConstraint(NSLayoutConstraint(item: prevNum, attribute: .Top, relatedBy: .Equal, toItem: displayArea, attribute: .Top, multiplier: 1, constant: 0))
        displayArea.addConstraint(NSLayoutConstraint(item: prevNum, attribute: .Left, relatedBy: .Equal, toItem: displayArea, attribute: .Left, multiplier: 1, constant: 10))
        displayArea.addConstraint(NSLayoutConstraint(item: prevNum, attribute: .Right, relatedBy: .Equal, toItem: operatorSign, attribute: .Left, multiplier: 1, constant: 0))
        displayArea.addConstraint(NSLayoutConstraint(item: prevNum, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: displayHeight/4))
        
        displayArea.addConstraint(NSLayoutConstraint(item: operatorSign, attribute: .Top, relatedBy: .Equal, toItem: displayArea, attribute: .Top, multiplier: 1, constant: 0))
        displayArea.addConstraint(NSLayoutConstraint(item: operatorSign, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth/5))
        displayArea.addConstraint(NSLayoutConstraint(item: operatorSign, attribute: .Right, relatedBy: .Equal, toItem: displayArea, attribute: .Right, multiplier: 1, constant: -10))
        displayArea.addConstraint(NSLayoutConstraint(item: operatorSign, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: displayHeight/4))
        
        displayArea.addConstraint(NSLayoutConstraint(item: messageBoard, attribute: .Top, relatedBy: .Equal, toItem: currentNum, attribute: .Bottom, multiplier: 1, constant: 0))
        displayArea.addConstraint(NSLayoutConstraint(item: messageBoard, attribute: .Left, relatedBy: .Equal, toItem: displayArea, attribute: .Left, multiplier: 1, constant: 10))
        displayArea.addConstraint(NSLayoutConstraint(item: messageBoard, attribute: .Right, relatedBy: .Equal, toItem: displayArea, attribute: .Right, multiplier: 1, constant: -10))
        displayArea.addConstraint(NSLayoutConstraint(item: messageBoard, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: displayHeight/4))
        
        displayArea.addConstraint(NSLayoutConstraint(item: currentNum, attribute: .Top, relatedBy: .Equal, toItem: prevNum, attribute: .Bottom, multiplier: 1, constant: 0))
        displayArea.addConstraint(NSLayoutConstraint(item: currentNum, attribute: .Left, relatedBy: .Equal, toItem: displayArea, attribute: .Left, multiplier: 1, constant: 10))
        displayArea.addConstraint(NSLayoutConstraint(item: currentNum, attribute: .Right, relatedBy: .Equal, toItem: displayArea, attribute: .Right, multiplier: 1, constant: -10))
        displayArea.addConstraint(NSLayoutConstraint(item: currentNum, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: displayHeight/2))
        

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
        keyPad.addSubview(buttonInverse)

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
        
        keyPad.addConstraint(NSLayoutConstraint(item: button7, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button7, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button7, attribute: .Left, relatedBy: .Equal, toItem: keyPad, attribute: .Left, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button7, attribute: .Bottom, relatedBy: .Equal, toItem: button4, attribute: .Top, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button8, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button8, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button8, attribute: .Left, relatedBy: .Equal, toItem: button7, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button8, attribute: .Bottom, relatedBy: .Equal, toItem: button7, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button9, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button9, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button9, attribute: .Left, relatedBy: .Equal, toItem: button8, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button9, attribute: .Bottom, relatedBy: .Equal, toItem: button8, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMinus, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMinus, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMinus, attribute: .Left, relatedBy: .Equal, toItem: button9, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMinus, attribute: .Bottom, relatedBy: .Equal, toItem: button9, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button5, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button5, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button5, attribute: .Left, relatedBy: .Equal, toItem: button4, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button5, attribute: .Bottom, relatedBy: .Equal, toItem: button4, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button6, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button6, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button6, attribute: .Left, relatedBy: .Equal, toItem: button5, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button6, attribute: .Bottom, relatedBy: .Equal, toItem: button5, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMultiply, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMultiply, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMultiply, attribute: .Left, relatedBy: .Equal, toItem: button6, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonMultiply, attribute: .Bottom, relatedBy: .Equal, toItem: button6, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button2, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button2, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button2, attribute: .Left, relatedBy: .Equal, toItem: button1, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button2, attribute: .Bottom, relatedBy: .Equal, toItem: button1, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: button3, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: button3, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: button3, attribute: .Left, relatedBy: .Equal, toItem: button2, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: button3, attribute: .Bottom, relatedBy: .Equal, toItem: button2, attribute: .Bottom, multiplier: 1, constant: 0))

        keyPad.addConstraint(NSLayoutConstraint(item: buttonDivide, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDivide, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDivide, attribute: .Left, relatedBy: .Equal, toItem: button3, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDivide, attribute: .Bottom, relatedBy: .Equal, toItem: button3, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: buttonAC, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonAC, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonAC, attribute: .Left, relatedBy: .Equal, toItem: keyPad, attribute: .Left, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonAC, attribute: .Bottom, relatedBy: .Equal, toItem: button7, attribute: .Top, multiplier: 1, constant: 0))

        keyPad.addConstraint(NSLayoutConstraint(item: buttonEdit, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonEdit, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonEdit, attribute: .Left, relatedBy: .Equal, toItem: buttonAC, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonEdit, attribute: .Bottom, relatedBy: .Equal, toItem: buttonAC, attribute: .Bottom, multiplier: 1, constant: 0))

        keyPad.addConstraint(NSLayoutConstraint(item: buttonPercent, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonPercent, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonPercent, attribute: .Left, relatedBy: .Equal, toItem: buttonEdit, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonPercent, attribute: .Bottom, relatedBy: .Equal, toItem: buttonEdit, attribute: .Bottom, multiplier: 1, constant: 0))

        keyPad.addConstraint(NSLayoutConstraint(item: buttonPlus, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonPlus, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonPlus, attribute: .Left, relatedBy: .Equal, toItem: buttonPercent, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonPlus, attribute: .Bottom, relatedBy: .Equal, toItem: buttonPercent, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDecimal, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDecimal, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDecimal, attribute: .Left, relatedBy: .Equal, toItem: button0, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonDecimal, attribute: .Bottom, relatedBy: .Equal, toItem: button0, attribute: .Bottom, multiplier: 1, constant: 0))
        
        keyPad.addConstraint(NSLayoutConstraint(item: buttonInverse, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonInverse, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonInverse, attribute: .Left, relatedBy: .Equal, toItem: buttonDecimal, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonInverse, attribute: .Bottom, relatedBy: .Equal, toItem: buttonDecimal, attribute: .Bottom, multiplier: 1, constant: 0))

        keyPad.addConstraint(NSLayoutConstraint(item: buttonEqual, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonWidth))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonEqual, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: buttonHeight))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonEqual, attribute: .Left, relatedBy: .Equal, toItem: buttonInverse, attribute: .Right, multiplier: 1, constant: 0))
        keyPad.addConstraint(NSLayoutConstraint(item: buttonEqual, attribute: .Bottom, relatedBy: .Equal, toItem: buttonInverse, attribute: .Bottom, multiplier: 1, constant: 0))

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

