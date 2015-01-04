import Foundation;

// Playground - noun: a place where people can play
// Lesson 04


//-------------------------------------------------------------------------------

func helloWorld() {
    println("Hello Function!");
    println("again!");
}

helloWorld();
helloWorld();
helloWorld();

// Defining a function -- basics ------------------------------------------------





//-------------------------------------------------------------------------------

var nameOfPerson:String = "Human";

func helloWorldToName(name:String) {
    println("Hello, \(name)!");
}

helloWorldToName("Animal");
helloWorldToName(nameOfPerson);
helloWorldToName("Nobody")


// function with a string parameter --------------------------------------------




//-------------------------------------------------------------------------------

var nameOfDog:String = "Tom";

func helloWorldToOptionalDog(name:String?) {
    if let realName = name {
        var string = "Hello \(name)";
        println(string)
    }
}

helloWorldToOptionalDog(nil);

// function with a string nil parameter -----------------------------------------




//-------------------------------------------------------------------------------

func helloWorldToTwoPeople (nameOne:String, nameTwo: String) {
    println("Hello, \(nameOne) and \(nameTwo)!");
}

helloWorldToTwoPeople("Chris", "Dennis");
helloWorldToTwoPeople("Daniel", "Trey");

// function with two parameters -------------------------------------------------



//-------------------------------------------------------------------------------

func formattedHelloWorldTextToName(name:String) -> String {
    return "Hello \(name), have a great class!"
}

println(formattedHelloWorldTextToName("Taylor") + " Woohoo!");

var formattedText = formattedHelloWorldTextToName("Sean");
println(formattedText);

// function that returns values -------------------------------------------------



//-------------------------------------------------------------------------------

func lengthOfNames(nameOne: String, nameTwo: String) -> (Int, Int) {
    return (countElements(nameOne), countElements(nameTwo));
}

println(lengthOfNames("Tom", "Einstein"));

var lengths = lengthOfNames("Mitsuhiro", "Szell");

println(lengths.0);
println(lengths.1);

// function that returns multiple values ----------------------------------------



// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

// TODO: Write a function that prints out "Hello world!" 10 times

func sayHelloWorldTenTimes() {
    for index in 1...10 {
        println("Hello World! (\(index)th time)");
    }
}

sayHelloWorldTenTimes();

//-------------------------------------------------------------------------------





// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

func showIterationIndex() {
    for index in 1...20 {
        println("Hit this line \(index) times!")
    }
}

showIterationIndex();

//-------------------------------------------------------------------------------





// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

func acceptNameAsParemeter(name:String) {
    println("Hello, \(name)")
}

acceptNameAsParemeter("Bob");
acceptNameAsParemeter("Mike");
acceptNameAsParemeter("Bill");

//-------------------------------------------------------------------------------



// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

func acceptStringOptionalAsParameter(name:String?) {
    if let realName = name {
        println("Hello, \(name)! -- optional string exists");
    } else {
        println("Hello World! -- optional string doesn't exist")
    }
}

acceptStringOptionalAsParameter(nil);
acceptStringOptionalAsParameter("Jane");

//-------------------------------------------------------------------------------






// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.


//-------------------------------------------------------------------------------

func testFibonacci(nth:Int){
    var counter2 = 0;
    var fibonacci1:Int = 0;
    var fibonacci2:Int = 1;
    var fibonacci3:Int = fibonacci1 + fibonacci2;
    
    while counter2 < nth - 1 {
        println( "\(counter2 + 1)th fibonacci number is \(fibonacci1)");
        counter2 = counter2 + 1;
        fibonacci3 = fibonacci1 + fibonacci2;
        fibonacci1 = fibonacci2;
        fibonacci2 = fibonacci3;
    }
    // while loop only runs until nth - 1 because of how the counter is set up
    
    println("\(nth)th fibonacci number is \(fibonacci1)");
}

testFibonacci(15);

// Above is a test function to see fibonacci progression -------------------------




//-------------------------------------------------------------------------------


func calculateFibonacci(nth:Int) -> Int{
    var counter2 = 0;
    var fibonacci1:Int = 0;
    var fibonacci2:Int = 1;
    var fibonacci3:Int = fibonacci1 + fibonacci2;
    
    while counter2 < nth - 1 {
        counter2 = counter2 + 1;
        fibonacci3 = fibonacci1 + fibonacci2;
        fibonacci1 = fibonacci2;
        fibonacci2 = fibonacci3;
    }
    // while loop only runs until nth - 1 because of how the counter is set up
    
    return fibonacci1;
}

println(calculateFibonacci(5));

// Above is the function that actually returns nth fibonacci number -- first attempt.




func generateNthFibonacci(nth:Int) -> Int {
    var f1:Int = 0;
    var f2:Int = 1;
    
    if nth == 1 {
        return 0;
    } else if nth == 2 {
        return 1;
    } else {
        var fib:Int = 0;
        for index in 3...nth{
            fib = f1 + f2;
            
            f1 = f2;
            f2 = fib;
        }
        return fib;
        
    }
    
}

// Above is a complete function for fibonacci progression -- second attempt

generateNthFibonacci(1);
generateNthFibonacci(2);
generateNthFibonacci(3);
generateNthFibonacci(4);
generateNthFibonacci(5);
generateNthFibonacci(6);







// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.


func sumOfFibonacci(fib:Int) {
    var sumOf20Fib:Int = 0;
    
    for index in 1...20 {
        sumOf20Fib = sumOf20Fib + 1;
    
    }

}



// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings

// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.






//////////////////////////////////////////////////

////////////// in class practice /////////////////

//////////////////////////////////////////////////


func generateRandomNumber() {
    var aRandomNumber = rand();
    println("Random number generated: \(aRandomNumber)")
    
}
// A function that prints a random number

generateRandomNumber();




func returnRandomNumber() -> Int {
    var aRandomNumber:Int = Int(rand());
    return aRandomNumber;
}
// a function that returns a random number

println(returnRandomNumber());

returnRandomNumber();



func twoNumberReturns(firstNum:Int, secondNum:Int) -> Int {
    return firstNum * secondNum;
}
// a function that takes two numbers and returns the multiplification

println(14, 16);



func twoNumberRandomMultiply (firstNum:Int, secondNum:Int) -> (Int, Int) {
    var firstRandomMultiply: Int = Int(rand()) * firstNum;
    var secondRandomMultiply: Int = Int(rand()) * secondNum;
    
    return (firstRandomMultiply, secondRandomMultiply);
    
}
// a function that takes two numbers and returns pair of multiplification by random numbers

println(twoNumberRandomMultiply(4,6));

var randomTwoNumbers = twoNumberRandomMultiply(3,19);

println(randomTwoNumbers);




////////////////////////////////////////////////////////////////////////////
////
//// a function that determines whether a string contains a lowercase "l"
////
////////////////////////////////////////////////////////////////////////////


func determineWhetherLowercaseL (string:String) -> Bool {
    
    
    for characterCount in string {
        if characterCount == "l" {
            return true;
        }
    }

    return false;

}

println(determineWhetherLowercaseL("TestTest"));

println(determineWhetherLowercaseL("LowetwerlL"));



class Human {
    var humanName: String?

}

var ruddTaylor = Human();

ruddTaylor.humanName = "Rudd";

println(ruddTaylor.humanName);


var travis = Human();
travis.humanName = "Travis";
println(travis.humanName)
travis = ruddTaylor;
println(travis.humanName);


let sean = Human();

sean.humanName = "Sean";

sean.humanName = "Taylor";

// sean = travis; --> This will cause error.

