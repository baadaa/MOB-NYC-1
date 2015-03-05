//
//  Weather.swift
//  WeatherInMVC
//
//  Created by Bumhan Yu on 3/2/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import Foundation

class Weather {
    var friendlyWeather: NSString?
    
    init(json: NSDictionary) {
        if let weather = json["weather"] as? NSArray {
            
            if let firstWeather = weather.firstObject as? NSDictionary {
                if let description = firstWeather["description"] as? NSString {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        self.friendlyWeather = description
                        
                        
                    }) // This calls the main processing queue
                }
                
            }
        }
    }
    
    class func retrieveWeather (completionHander: ((Weather) -> Void)) {
        if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=nyc,ny") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as? NSDictionary {
                    
                    var weatherNow = Weather(json: jsonDict)
                    
                    if let friendlyWeather = weatherNow.friendlyWeather {}
                        dispatch_async(dispatch_get_main_queue(), {
                            completionHander(weatherNow)

                        })
                    }
                
            })
            task.resume()
        }
    }
    
    // completionHandler is a call-back that happens when an asynchrosity is done. It gets called with some parameters and may or may not return something. In this case, it returns nothing, thus Void.
}
