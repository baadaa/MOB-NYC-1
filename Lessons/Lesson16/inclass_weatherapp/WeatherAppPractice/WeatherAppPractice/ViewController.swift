//
//  ViewController.swift
//  WeatherAppPractice
//
//  Created by Bumhan Yu on 3/2/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weatherJson: NSDictionary?
    
    var weatherDescription = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
//        if let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=nyc,ny") {
        if let url = NSURL(string: "http://werkljsdfgkldfsgkjhfdglkjhsdfglhjkjsdhfdfg.com") {
      
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                var jsonError: NSError?
                
                
                if let errorMessage = error {
                    // println(errorMessage)
                    self.showError(errorMessage)
                
                }
                
                if let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as? NSDictionary {
                    self.weatherJson = jsonDict
                    dispatch_async(dispatch_get_main_queue(), {
                        //
                  

                        })
                    
                
                    self.parseWeather()
                    println(jsonError)

                }

            })
            
            task.resume()

        }
    }
    
    func parseWeather() {
        
        if let json = self.weatherJson {
            if let weather = json["weather"] as? NSArray {
                if let description = weather[0]["description"] as? NSString {
                println(description)
                
                displayWeather(description)
                    
                }
            }
        
        }
        
    }
    
    func displayWeather(description: String) {
    
        self.view.addSubview(weatherDescription)
        
        weatherDescription.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        weatherDescription.text = description
        self.view.addConstraint(NSLayoutConstraint(item: weatherDescription, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: weatherDescription, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0))
        
    }
    
    func showError(errorMessage: NSError) {
        self.view.addSubview(weatherDescription)
        
        weatherDescription.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        weatherDescription.text = toString(errorMessage.localizedDescription)
        
        
        self.view.addConstraint(NSLayoutConstraint(item: weatherDescription, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: weatherDescription, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0))
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

