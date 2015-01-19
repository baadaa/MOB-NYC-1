//
//  Dog.swift
//  Lesson03
//
//  Created by Bumhan Yu on 1/18/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class Dog: Animal {
    
    override func prettyAnimalName() -> String {
        return "Dog name: " + self.name
    }
}
