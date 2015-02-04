// Playground - noun: a place where people can play

import UIKit

var mysteryType: String = ""
    // This is explicitly declared as String

var anotherMystery: [String] = []
    // Empty Array of Strings

var anotherWayToDefine = Array<String>()
    // This is exactly the same as the statement above

var notSoMuchAMystery = ["foo", "bar"]
    // Array of Strings

anotherMystery.append("woohoo!")
    // Adds a new String to Array

anotherMystery[0]
    // Refers to the added String


var yetAnother: [String: String] = [:]
    // Dictionary matching a String to another String

var anotherWatToDefineDict = Dictionary<String, String> ()
    // This is exactly the same as the statement above

yetAnother["name"] = "rudd"
yetAnother["name"]
yetAnother["age"]
    // These are by nature optional


var veryConfusing: [[String:String]] = []
    // This is an empty Array of String-to-String Dictionary

var anotherConfusion: [[String]]
    // Array of Arrays

veryConfusing.append(["hi": "angel!"])
    // Adding a new Dictionary element to Array

var arrayOfDicts: [[String: String]] = [
    [
        "name": "laundry",
        "date": "today",
        "status": "done"
    ],
    [
        "name": "clean house",
        "date": "tomorrow",
        "status": "not done"
    ]
]
    // Array of Dictionaries declared.

arrayOfDicts[0]
    // Refers to the 0th element in the Array
    // Note Dictionary keys don't have an order associated with it.

