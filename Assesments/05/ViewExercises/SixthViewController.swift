//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 6"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.exerciseView.addSubview(tableView)
        self.tableView.frame = self.exerciseView.frame
        self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController!.navigationBar.frame), 0, 0, 0)
        self.tableView.autoresizingMask = self.exerciseView.autoresizingMask
        
        self.tableView.rowHeight = 50
            // set the rowHeight of the tableView to 50 to avoid potential issue which cause error
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        /* TODO:
        The table view cells on this screen are blank.
        
        Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
        */
        
        var stringAtSpecifiedIndex = "Row " + toString(indexPath.row)
        
        var greenLabel = UILabel()
        
        greenLabel.backgroundColor = UIColor.greenColor()
        greenLabel.layer.cornerRadius = 5
        greenLabel.layer.borderColor = UIColor.blueColor().CGColor
        greenLabel.layer.borderWidth = 1.0
        greenLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        greenLabel.text = stringAtSpecifiedIndex
        greenLabel.textAlignment = NSTextAlignment.Center
        
        
        cell?.contentView.addSubview(greenLabel)
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .CenterX, relatedBy:.Equal, toItem: cell?.contentView, attribute: .CenterX, multiplier: 1, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .CenterY, relatedBy:.Equal, toItem: cell?.contentView, attribute: .CenterY, multiplier: 1, constant: 0))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .Height, relatedBy:.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 30))
        cell?.contentView.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: .Width, relatedBy:.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 120))

        
        return cell!
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
