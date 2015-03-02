//
//  ViewController.swift
//  GooglePrinterExercise
//
//  Created by Bumhan Yu on 2/25/15.
//  Copyright (c) 2015 Bumhan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidAppear(animated: Bool) {
        if let url = NSURL(string: "http://google.com") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                var webContentString = NSString(data: data, encoding: NSUTF8StringEncoding)
                
//                self.textView.text = webContentString
                    // updating UI here causes the app to crash. iOS paradigm of main UI queue of operation vs. background thread of URL operation. Separate queues of operation prevents app from freezing when making network request.
                NSError
                dispatch_async(dispatch_get_main_queue(), {self.textView.text = webContentString})
                    // This will lead the app jump back to main queue
                
            })
            task.resume()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

