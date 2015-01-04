//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {


    @IBOutlet weak var fibonacciIndex: UITextField!
    // Text field for fibonacci index input

    @IBOutlet weak var fibonacciResult: UILabel!
    // Text field for final result display
    
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
    
    @IBAction func calculateFibonacci(sender: AnyObject) {
        
        if let test = fibonacciIndex.text.toInt() {
            // Fibonacci is calculated only when a valid natural number is entered.
            var fib:Int = fibonacciIndex.text.toInt()!;
            
            if fib < 1 {
                fibonacciResult.text = "Enter a number greater than 0!"
                fibonacciIndex.text = "";
                // Prevent an error when user inputs invalid index number
                
            } else {
            
            var value = Fibonacci.fibonacciNumberAtIndex(fib);
                // Fetches the fibonacci value via the method within Fibonacci class.
        
            fibonacciResult.text = "fibonacci " + fibonacciIndex.text + " is ... " + String(value);
                
            fibonacciIndex.text = "";
                // Text field is reset, making it ready for another input.
            }
        }
    }
    
    
    class Fibonacci {
        
        class func fibonacciNumberAtIndex(fibIndex:Int) -> Int {

            var f1:Int = 0;
            var f2:Int = 1;
            // Set 1st and 2nd Fibonacci numbers
            
            var fibResult:Int = 0;
            // Variable for the result
            
                if fibIndex == 1 {
                    fibResult = 0;
                } else if fibIndex == 2 {
                    fibResult = 1;
                } else {
                
                    for index in 3...fibIndex{
                        fibResult = f1 + f2;
                        f1 = f2;
                        f2 = fibResult;
                }
        
            }
            return fibResult;
        }
        
    }
    
}
