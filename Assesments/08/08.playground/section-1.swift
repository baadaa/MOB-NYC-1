// Playground - noun: a place where people can play
// Assignment 8 playground


import XCPlayground
import UIKit

// Let asynchronous code run
XCPSetExecutionShouldContinueIndefinitely()




//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

func successfulNetworkConnection (url: String) {
    
    if let validUrl = NSURL(string: url) {
        let loadGoogle = NSURLSession.sharedSession().dataTaskWithURL(validUrl, completionHandler: { (data, response, error) -> Void in
            
            println(response)
            println(data)
            println(error)
            // check to see if data/response/error exists
            
            if let googleDataString = NSString(data: data, encoding: NSUTF8StringEncoding)
            {
                println(googleDataString)
            }
            // check for optional data from URLSession, and print it out
            
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
            // check to see if data/response/error exists
            
            if let errorMessage = error {
                println("Error Domain is: \(errorMessage.domain)")
                println("Error Code is: \(errorMessage.code)")
                println(errorMessage.localizedDescription)
            }
            // if there's an error, print out details about it
            
            if let networkResponse = response {
                if let responseUrl = networkResponse.URL{
                    println("Responding URL is: \(responseUrl)")
                }
                if let responseFilename = networkResponse.suggestedFilename{
                    println("Responding Suggested Filename is: \(responseFilename)")
                }
                if let responseMIMEtype = networkResponse.MIMEType{
                    println("Responding MIME Type is: \(responseMIMEtype)")
                }
                if let responseEncoding = networkResponse.textEncodingName{
                    println("Responding Encoding Name is: \(responseEncoding)")
                }
                println("Expected Content Length is: \(networkResponse.expectedContentLength)" )
            }
            // if there's a response from server, print out details
            
        })
        
        loadGA.resume()
    }
}

failingNetworkConnection("http://generalassemb.ly/foobar.baz")
// This will print out response details

failingNetworkConnection("http://stupidNonExistentAddress.fail")
// This will print out error message details

//--------------------------------------------------------





//TODO three: Make a successful network connection to "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US", an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

func getNYCWeather(url: String) {
    
    if let owmUrl = NSURL(string: url) {
        
        let weatherTask = NSURLSession.sharedSession().dataTaskWithURL(owmUrl, completionHandler: { (data, response, error) -> Void in
            
            if let weatherDict = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as? NSDictionary {
                
                println(parseJSON(weatherDict))
                
            }
        })
        weatherTask.resume()
    }
    
}
// This function retrieves the JSON and prints the parsed result


func parseJSON(json: NSDictionary) -> String {
    
    var weatherNow:String = ""
    
    if let weather = json["weather"] as? NSArray {
        if let firstWeather = weather.firstObject as? NSDictionary {
            if let description = firstWeather["description"] as? NSString {
                weatherNow = "Current Weather: " + description
            }
        }
    }
    
    if let main = json["main"] as? NSDictionary {
        if let temperature = main["temp"] as? Float {
            weatherNow += ", and Current Temperature: " + toString(temperature) + " (Kelvin)"
        }
    }
    
    return weatherNow
}
// This function parses the JSON


getNYCWeather("http://api.openweathermap.org/data/2.5/weather?q=New%20York,US")

//--------------------------------------------------------







//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.



//
//
//
// AFTER COUNTLESS ATTEMPTS TO IMPORT SWIFTYJSON INTO PLAYGROUND, I FINALLY GIVE IN.
//
// PLEASE SEE XCODE PROJECT FOR TODO FOUR, WHERE COCOAPODS IS USED TO INCORPORATE SWIFTYJSON
//
//



