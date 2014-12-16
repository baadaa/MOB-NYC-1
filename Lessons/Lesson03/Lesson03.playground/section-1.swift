// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.

var name:String;
var age:Int;

name = "Bumhan Yu";
age = 34;

//-----------------------------------------------------------------------------------





// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"

println("Hello \(name), you are \(age) years old!");

//-----------------------------------------------------------------------------------





// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”

if age >= 21 {
    println("You can drink!");
}

if age >= 18 {
    println("You can vote!");
}

if age >= 16 {
    println("You can drive!");
}

//-----------------------------------------------------------------------------------






// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.

if age >= 21 {
    println("You can drive, vote and drink! (but not at the same time!)");
} else if age >= 18 {
    println("You can drive and vote!");
} else if age >= 16 {
    println("You can drive!");
}
    // This code block checks age from higher to lower range


if age >= 16 && age < 18 {
    println("You can drive!");
} else if age >= 18 && age < 21 {
    println("You can drive and vote!");
} else if age > 21 {
    println("You can drive, vote and drink! (but not at the same time!)");
}
    // This code block checks age from lower to higher range


//-----------------------------------------------------------------------------------





// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)

var numberUsed:Int = 7;
var counter1:Int = 0;

while counter1 < 50 {
    println(numberUsed * (counter1 + 1) - 1);
    counter1 = counter1 + 1;
}
    // This code block uses while loop

for index1 in 1...50 {
    println(numberUsed * index1 - 1 );
}
    // This code block uses for loop

//-----------------------------------------------------------------------------------






// TODO: Create a constant called number

let numberConstant = 13;

println

//-----------------------------------------------------------------------------------





// TODO: Print whether the above number is even

if numberConstant % 2 == 0 {    // Check the remainder when devided by 2
    println("The number constant is even");
} else {
    println("The number constant is odd)");
}

//-----------------------------------------------------------------------------------






// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below

var counter2 = 0;
var fibonnaci1:Int = 0;
var fibonnaci2:Int = 1;
var fibonnaci3:Int = fibonnaci1 + fibonnaci2;

while counter2 < 37 {
    println( "\(counter2 + 1) th fibonacci number is \(fibonnaci1)");
    counter2 = counter2 + 1;
    fibonnaci3 = fibonnaci1 + fibonnaci2;
    fibonnaci1 = fibonnaci2;
    fibonnaci2 = fibonnaci3;
}
//-----------------------------------------------------------------------------------






// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()

var myName:String = "Bumhan Yu";
var lengthOfName:Int = countElements(myName);

println("Hello, \(myName), your name is \(lengthOfName) characters long!");

//-----------------------------------------------------------------------------------





// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.


var sum = 0;

for indexHundred in 1...100 {
    var randomNumber = Int(rand());
    println("\(indexHundred): \(randomNumber)");
    sum = sum + randomNumber;
}

println("Sum of the hundred random numbers above is \(sum)");

//-----------------------------------------------------------------------------------

