//
//  ViewController.swift
//  HW8-ToDoFour
//
//  Created by Bumhan Yu on 3/21/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

// TODO FOUR CODES HERE!!

//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        func parseJSONbySwiftyJSON(json: JSON) -> String{
            
            let weather = json["weather"][0]["description"].stringValue
            let temperature = json["main"]["temp"].floatValue
                // Retrieve weather description and temperature
            
            let weatherNow:String = "Current Weather: " + weather + "\nCurrent Temperature: " + toString(temperature) + " (kelvin)"
                // Combine two values into a String
            
            return weatherNow
            
        }

        
        func getNYCWeatherViaSwiftyJSON(url: String) {
            
            if let owmUrl = NSURL(string: url) {
                let weatherTask = NSURLSession.sharedSession().dataTaskWithURL(owmUrl, completionHandler: { (data, response, error) -> Void in
                    
                    var json = JSON(data:data)
                    
                    println(parseJSONbySwiftyJSON(json))
                    
                })
                weatherTask.resume()
            }
            
        }
        // This function retrieves the JSON and prints the parsed result
        
        
        
        getNYCWeatherViaSwiftyJSON("http://api.openweathermap.org/data/2.5/weather?q=New%20York,US")
        

    }
    
    
}

