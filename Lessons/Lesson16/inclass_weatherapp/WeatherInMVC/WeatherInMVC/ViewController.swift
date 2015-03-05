//
//  ViewController.swift
//  WeatherInMVC
//
//  Created by Bumhan Yu on 3/2/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        Weather.retrieveWeather { (weather) -> Void in
            self.weatherLabel.text = weather.friendlyWeather
        }

    }

}

