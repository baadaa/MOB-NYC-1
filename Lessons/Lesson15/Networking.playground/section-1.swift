// Playground - noun: a place where people can play

import UIKit
import XCPlayground

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()

//// Lines from 4-7 are required to deal with network requests in playground.

if let url = NSURL(string: "http://google.com") { // this request returns HTML document
    let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
        println(response)
        println(data) // this returns blob of bits. SWIFT doesn't care/tell what the data format is
        
        println(data)
        var string = NSString(data: data, encoding: NSUTF8StringEncoding)
            // encoding is required
        println(string)
    })
    task.resume()
}

//if let url = NSURL(string: "http://www.reddit.com/.json") {
//    let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//        var string = NSString(data: data, encoding: NSUTF8StringEncoding)
//            println(string)
//        var json = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil)
//        println(json)
//    })
//    task.resume()
//}
