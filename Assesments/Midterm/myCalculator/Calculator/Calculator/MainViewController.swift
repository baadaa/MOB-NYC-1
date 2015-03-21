//
//  MainViewController.swift
//  Calculator
//
//  Created by Bumhan Yu on 2/21/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class MainViewController: DrawCalculator {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
        buttonMinus.addTarget(self, action: "calcKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonMultiply.addTarget(self, action: "calcKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonDivide.addTarget(self, action: "calcKeyTapped:", forControlEvents: UIControlEvents.TouchUpInside)
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
                resetNumber()
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
                    calcResult = existingNumForCalc + currentNumForCalc
                    break
                case "-":
                    calcResult = existingNumForCalc - currentNumForCalc
                    break
                case "/":
                    if currentNumForCalc == 0 {
                        resetNumber()
                        messageBoard.text = "You cannot divide by zero!"
                        operatorSign.text = ""
                        break
                    }
                    calcResult = existingNumForCalc / currentNumForCalc
                    break
                case "*":
                    calcResult = existingNumForCalc * currentNumForCalc
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
                
                if lastTappedKey == "+" {
                    return
                }
                // This is to prevent glitches when user keeps tapping operator buttons more than a single time
                
                prevNum.text = performCalculation(tappedCalc)
                
                operatorSign.text = " + "
                currentNum.text = "0"
                decimalDigit = 0
                wholeDigit = 1
                isDecimal = false
                lastTappedOperator = tappedCalc
                lastTappedKey = tappedCalc
                
            case "-":
                
                if lastTappedKey == "=" {
                    operatorSign.text = tappedCalc
                    prevNum.text = currentNum.text!
                    currentNum.text = "0"
                    wholeDigit = 1
                    isDecimal = false
                    lastTappedOperator = "-"
                    lastTappedKey = "-"
                    return
                }
                
                if lastTappedKey == "-" {
                    return
                }
                // This is to prevent glitches when user keeps tapping operator buttons more than a single time
                
                prevNum.text = performCalculation(tappedCalc)
                
                operatorSign.text = " - "
                currentNum.text = "0"
                decimalDigit = 0
                wholeDigit = 1
                isDecimal = false
                lastTappedOperator = tappedCalc
                lastTappedKey = tappedCalc
                
            case "*":
                
                if lastTappedKey == "=" {
                    operatorSign.text = tappedCalc
                    prevNum.text = currentNum.text!
                    currentNum.text = "0"
                    wholeDigit = 1
                    isDecimal = false
                    lastTappedOperator = "*"
                    lastTappedKey = "*"
                    return
                }
                
                if lastTappedKey == "*" {
                    return
                }
                // This is to prevent glitches when user keeps tapping operator buttons more than a single time
                
                if lastTappedKey == "1" || lastTappedKey == "2" || lastTappedKey == "3" || lastTappedKey == "4" || lastTappedKey == "5" || lastTappedKey == "6" || lastTappedKey == "7" || lastTappedKey == "8" || lastTappedKey == "9" || lastTappedKey == "0" {
                    prevNum.text = performCalculation(tappedCalc)
                }
                
                operatorSign.text = " * "
                currentNum.text = "0"
                decimalDigit = 0
                wholeDigit = 1
                isDecimal = false
                lastTappedOperator = tappedCalc
                lastTappedKey = tappedCalc
                
            case "/":
                
                if lastTappedKey == "=" {
                    operatorSign.text = tappedCalc
                    prevNum.text = currentNum.text!
                    currentNum.text = "0"
                    wholeDigit = 1
                    isDecimal = false
                    lastTappedOperator = "/"
                    lastTappedKey = "/"
                    return
                }
                
                if lastTappedKey == "/" {
                    return
                }
                // This is to prevent glitches when user keeps tapping operator buttons more than a single time
                
                if lastTappedKey == "1" || lastTappedKey == "2" || lastTappedKey == "3" || lastTappedKey == "4" || lastTappedKey == "5" || lastTappedKey == "6" || lastTappedKey == "7" || lastTappedKey == "8" || lastTappedKey == "9" || lastTappedKey == "0" {
                    prevNum.text = performCalculation(tappedCalc)
                }
                
                operatorSign.text = " / "
                currentNum.text = "0"
                decimalDigit = 0
                wholeDigit = 1
                isDecimal = false
                lastTappedOperator = tappedCalc
                lastTappedKey = tappedCalc
                
            case "=":
                
                if lastTappedKey == "=" {
                    prevNum.text = currentNum.text! + " " + lastTappedOperator + " "
                    println("WIP")
                    
                    return
                    
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
    
    func resetNumber() {

        currentNum.text = "0"
        prevNum.text = ""
        operatorSign.text = ""
        messageBoard.text = ""
        
        isDecimal = false
        isNegative = false
        decimalDigit = 0
        wholeDigit = 1

        lastTappedKey = ""
        lastTappedOperator = ""
        lastTappedNumber = ""
        
        lastInputNumber = ""
        calcResult = 0

        prevNum.text = ""
        operatorSign.text = ""
        currentNum.text = "0"
    
    
    }


}
