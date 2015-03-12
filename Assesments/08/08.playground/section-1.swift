// Assignment 8 playground

import UIKit
import XCPlayground

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()




//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

func successfulNetworkConnection (url: String) {
    
    if let validUrl = NSURL(string: url) {
        let loadGoogle = NSURLSession.sharedSession().dataTaskWithURL(validUrl, completionHandler: { (data, response, error) -> Void in
            
            println(response)
            println(data)
            println(error)
            
            var googleDataString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(googleDataString)
            
        })
        
        loadGoogle.resume()
    }
}

successfulNetworkConnection("http://google.com")


//--------------------------------------------------------




//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.


func failingNetworkConnection(url: String) {
    if let invalidUrl = NSURL(string: url) {
        
        let loadGA = NSURLSession.sharedSession().dataTaskWithURL(invalidUrl, completionHandler: { (data, response, error) -> Void in
            
            println(response)
            println(data)
            println(error)
            // There's no response, no data, but an error
            
            if let errorMessage = error {
                println("Error Domain is: \(errorMessage.domain)")
                println("Error Code is: \(errorMessage.code)")
                println(errorMessage.localizedDescription)
            }
            
        })
        
        loadGA.resume()
    }
}

failingNetworkConnection("http://generalassemb.ly/foobar.baz")

//--------------------------------------------------------





//TODO three: Make a successful network connection to "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US", an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

func getNYCWeather(url: String) {
    
    if let owmUrl = NSURL(string: url) {
        let weatherTask = NSURLSession.sharedSession().dataTaskWithURL(owmUrl, completionHandler: { (data, response, error) -> Void in
            
            if let weatherDict = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as? NSDictionary {
                
                println(parseJSON(weatherDict))
                
            }
        })
    }
}
    // This function retrieves the JSON and prints the parsed result


func parseJSON(json: NSDictionary) -> String {
    
    var weatherNow:String = ""
    
    if let weather = json["weather"] as? NSArray {
        if let firstWeather = weather.firstObject as? NSDictionary {
            if let description = firstWeather["description"] as? NSString {
                weatherNow = description
            }
        }
    }
    return weatherNow
}
    // This function parses the JSON


getNYCWeather("http://api.openweathermap.org/data/2.5/weather?q=New%20York,US")



//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.
