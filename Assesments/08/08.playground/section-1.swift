// Assignment 8 playground

import UIKit
import XCPlayground

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()




//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

//if let validUrl = NSURL(string: "http://google.com") {
//    
//    let loadGoogle = NSURLSession.sharedSession().dataTaskWithURL(validUrl, completionHandler: { (data, response, error) -> Void in
//        
//        println(response)
//        println(data)
//        println(error)
//        
//        var googleDataString = NSString(data: data, encoding: NSUTF8StringEncoding)
//        println(googleDataString)
//    
//    })
//
//    loadGoogle.resume()
//}

//--------------------------------------------------------




//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.

if let invalidUrl = NSURL(string: "http://generalassemb.ly/foobar.baz") {
    
    let loadGA = NSURLSession.sharedSession().dataTaskWithURL(invalidUrl, completionHandler: { (data, response, error) -> Void in
        
        println(response)
        println(data)
        println(error)
        
        var GADataString = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        println(GADataString)
        
    })
    
    loadGA.resume()
}


//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.
