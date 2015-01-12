import Foundation;

// Playground - noun: a place where people can play
// Lesson 04


// let oooi = 3.7 // it's a Double type variable;
// NOTE to SELF: difference between Double and Float types




/////////////////////////////////////////////////////////////////////////////////
////////////////////                                 ////////////////////////////
////////////////////         IN-CLASS PRACTICES      ////////////////////////////
////////////////////                                 ////////////////////////////
/////////////////////////////////////////////////////////////////////////////////


//-------------------------------------------------------------------------------
// 01. Defining a function -- basics --------------------------------------------
//-------------------------------------------------------------------------------

//    func helloWorld() {
//        println("Hello Function!");
//        println("again!");
//    }
//
//    helloWorld();
//    helloWorld();
//    helloWorld();




//-------------------------------------------------------------------------------
// 02. function with a string parameter -----------------------------------------
//-------------------------------------------------------------------------------

//    var nameOfPerson:String = "Human";
//
//    func helloWorldToName(name:String) {
//        println("Hello, \(name)!");
//    }
//
//    helloWorldToName("Animal");
//    helloWorldToName(nameOfPerson);
//    helloWorldToName("Nobody")






//-------------------------------------------------------------------------------
// 03. function with a optional string parameter --------------------------------
//-------------------------------------------------------------------------------

//    var nameOfDog:String = "Tom";
//
//    func helloWorldToOptionalDog(name:String?) {
//        if let realName = name {
//                var string = "Hello \(name)";
//            println(string);
//        } // Prints name string only when it exists
//    }
//
//    helloWorldToOptionalDog(nil);  // This prints nothing





//-------------------------------------------------------------------------------
// 04. function with two parameters ---------------------------------------------
//-------------------------------------------------------------------------------

//    func helloWorldToTwoPeople (nameOne:String, nameTwo: String) {
//        println("Hello, \(nameOne) and \(nameTwo)!");
//    }
//
//    helloWorldToTwoPeople("Chris", "Dennis");
//    helloWorldToTwoPeople("Daniel", "Trey");




//-------------------------------------------------------------------------------
// 05. function that returns values ---------------------------------------------
//-------------------------------------------------------------------------------

//    func formattedHelloWorldTextToName(name:String) -> String {
//        return "Hello \(name), have a great class!"
//    }
//
//    println(formattedHelloWorldTextToName("Taylor") + " Woohoo!");
//
//    var formattedText = formattedHelloWorldTextToName("Sean");
//    println(formattedText);




//-------------------------------------------------------------------------------
// 06. function that returns multiple values ------------------------------------
//-------------------------------------------------------------------------------

//    func lengthOfNames(nameOne: String, nameTwo: String) -> (Int, Int) {
//        return (countElements(nameOne), countElements(nameTwo));
//    } // countElements gets the length of a string
//
//    println(lengthOfNames("Tom", "Einstein"));
//
//    var lengths = lengthOfNames("Mitsuhiro", "Szell");
//
//    println(lengths.0);
//    println(lengths.1); // NOTE TO SELF: see .0 and .1



//-------------------------------------------------------------------------------
// 07. function that prints a random number -------------------------------------
//-------------------------------------------------------------------------------

//    func generateRandomNumber() {
//        var aRandomNumber = rand();
//        println("Random number generated: \(aRandomNumber)")
//    
//    }
//
//    generateRandomNumber();



//-------------------------------------------------------------------------------
// 08. function that returns a random number (Integer) --------------------------
//-------------------------------------------------------------------------------

//    func returnRandomNumber() -> Int {
//        var aRandomNumber:Int = Int(rand());
//        return aRandomNumber;
//    }
//
//    println(returnRandomNumber());
//
//    returnRandomNumber();



//---------------------------------------------------------------------------------
// 09. function that takes two numbers and returns the multiplification of the two
//---------------------------------------------------------------------------------

//    func twoNumberReturns(firstNum:Int, secondNum:Int) -> Int {
//        return firstNum * secondNum;
//    }
//
//    println(twoNumberReturns(14, 16));


//---------------------------------------------------------------------------------
// 10. function that takes two numbers, generates two random numbers, and returns
//     each input number multipled by the random number generated
//---------------------------------------------------------------------------------

//    func twoNumberRandomMultiply (firstNum:Int, secondNum:Int) -> (Int, Int) {
//        var firstRandomMultiply: Int = Int(rand()) * firstNum;
//        var secondRandomMultiply: Int = Int(rand()) * secondNum;
//    
//        return (firstRandomMultiply, secondRandomMultiply);
//    
//    }
//
//    println(twoNumberRandomMultiply(4,6)); // Prints results
//
//    var randomTwoNumbers = twoNumberRandomMultiply(3,19); // Stores results in a variable
//
//    println(randomTwoNumbers); // Prints stored values




//---------------------------------------------------------------------------------
// 11. function that determines whether a string contains a lowercase "l"
//---------------------------------------------------------------------------------

//    func determineWhetherLowercaseL (string:String) -> Bool {
//    
//        for characterCount in string {
//            if characterCount == "l" {
//                return true;
//            }
//        }
//    
//        return false;
//
//    // NOTE TO SELF: see how if loop works.
//
//    }
//
//    println(determineWhetherLowercaseL("TestTest"));
//
//    println(determineWhetherLowercaseL("LowetwerlL"));




/////////////////////////////////////////////////////
//                                                 //
//    IN-CLASS Demonstration of how Class works    //
//                                                 //
/////////////////////////////////////////////////////

//    class Human {
//        var humanName: String?
//        // This Class has an optional string property
//    }
//
//    var ruddTaylor = Human();
//
//    ruddTaylor.humanName = "Rudd";
//
//    println(ruddTaylor.humanName);
//
//
//    var travis = Human();
//
//    travis.humanName = "Travis";
//    println(travis.humanName)
//
//    travis = ruddTaylor;
//    println(travis.humanName);
//
//
//    let sean = Human();
//
//    sean.humanName = "Sean";
//    sean.humanName = "Taylor";
//
//    // sean = travis; --> This will cause error.




////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////


// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.

//-------------------------------------------------------------------------------

// TODO: Write a function that prints out "Hello world!" 10 times

//    func sayHelloWorldTenTimes() {
//        for index in 1...10 {
//            println("Hello World! (\(index)th time)");
//        }
//    }
//
//    sayHelloWorldTenTimes(); // prints the desired outcome 10 times.

//-------------------------------------------------------------------------------




//-------------------------------------------------------------------------------

// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times

//    func showIterationIndex() {
//        for index in 1...20 {
//            println("Hit this line \(index) times!")
//        }
//    }
//
//    showIterationIndex(); // prints the desired outcome

//-------------------------------------------------------------------------------




//-------------------------------------------------------------------------------

// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"

//    func acceptNameAsParemeter(name:String) {
//        println("Hello, \(name)")
//    }
//
//    acceptNameAsParemeter("Bob");
//    acceptNameAsParemeter("Mike");
//    acceptNameAsParemeter("Bill"); // prints the desired outcome

//-------------------------------------------------------------------------------




//-------------------------------------------------------------------------------

// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"

//    func acceptStringOptionalAsParameter(name:String?) {
//        if let realName = name {
//            println("Hello, \(name)! -- optional string exists");
//        } else {
//            println("Hello World! -- optional string doesn't exist")
//        }
//    }
//
//    acceptStringOptionalAsParameter(nil);
//    acceptStringOptionalAsParameter("Jane");

//-------------------------------------------------------------------------------





//-------------------------------------------------------------------------------

// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci
// sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.

//-------------------------------------------------------------------------------
// 00.

//    func testFibonacci(nth:Int){
//        var counter2 = 0;
//        var fibonacci1:Int = 0;
//        var fibonacci2:Int = 1;
//        var fibonacci3:Int = fibonacci1 + fibonacci2;
//    
//        while counter2 < nth - 1 {
//            println( "\(counter2 + 1)th fibonacci number is \(fibonacci1)");
//            counter2 = counter2 + 1;
//            fibonacci3 = fibonacci1 + fibonacci2;
//            fibonacci1 = fibonacci2;
//            fibonacci2 = fibonacci3;
//        }
//        // while loop only runs until nth - 1 because of how the counter is set up
//    
//        println("\(nth)th fibonacci number is \(fibonacci1)");
//    }
//
//    testFibonacci(15);
//
//// A test function to see fibonacci progression: NOT MEANT TO BE FINAL
//// This function works, but code structure is not too elegant.

//-------------------------------------------------------------------------------
// 01.

//    func calculateFibonacci(nth:Int) -> Int{
//        var counter2 = 0;
//        var fibonacci1:Int = 0;
//        var fibonacci2:Int = 1;
//        var fibonacci3:Int = fibonacci1 + fibonacci2;
//    
//        while counter2 < nth - 1 {
//            counter2 = counter2 + 1;
//            fibonacci3 = fibonacci1 + fibonacci2;
//            fibonacci1 = fibonacci2;
//            fibonacci2 = fibonacci3;
//        }
//        // while loop only runs until nth - 1 because of how the counter is set up
//    
//        return fibonacci1;
//    }
//
//    println(calculateFibonacci(5));
//
//// A function that actually returns nth fibonacci number -- first attempt.
//// This is the same as the test function above. NOT MEANT TO Be FINAL.
//// Functional, but not excellent.

//-------------------------------------------------------------------------------
// 02.

//    func generateNthFibonacci(nth:Int) -> Int {
//        var f1:Int = 0; // First fibonacci
//        var f2:Int = 1; // Second fibonacci
//        
//        if nth <= 0 {
//            println("Cannot calculate with your input");
//            return 0;
//        }
//        if nth == 1 {
//            return 0;
//        } else if nth == 2 {
//            return 1;
//        } else {
//            var fib:Int = 0;
//            for index in 3...nth{
//                fib = f1 + f2;
//            
//                f1 = f2;
//                f2 = fib;
//            }
//            return fib; // Final fibonacci as user request index
//        
//        }
//    
//    }
//
//    generateNthFibonacci(-1);
//    generateNthFibonacci(0);
//    generateNthFibonacci(1);
//    generateNthFibonacci(2);
//    generateNthFibonacci(3);
//    generateNthFibonacci(4);
//    generateNthFibonacci(5);
//    generateNthFibonacci(6);

//// Above is a complete function for fibonacci progression -- second attempt.
//// This is much cleaner and more readable.

//-------------------------------------------------------------------------------



//-------------------------------------------------------------------------------

// TODO: Write a function that calls the above function in order to print the sum of the first 20 fibonacci numbers.

//    func sumOfFibonacci(fib:Int) -> () {
//        var sumOfFib:Int = 0;
//        var fibonacciIndex:Int = 0;
//    
//        if fib <= 0 {
//            println("Cannot calculate with your input");
//            return;
//        }
//    
//        for index in 1...fib {
//            fibonacciIndex = generateNthFibonacci(index)
//            sumOfFib = sumOfFib + fibonacciIndex;
//    
//        }
//        println(sumOfFib);
//
//    }
//    // sumOfFibonacci(5);
//    sumOfFibonacci(20);
// 
//    // THIS FUNCTION REQUIRES generateNthFibonacci FUNCTION. DE-COMMENT.

//-------------------------------------------------------------------------------




//-------------------------------------------------------------------------------

// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.

//    func primeDeterminator (number: Int) -> String {
//        var divCounter:Int = 0;
//    
//        if number <= 1 {
//            return("Neither Prime Nor Composite");
//        } else if number == 2 {
//            return("Prime");
//        } else {
//    
//            for i in 2...(number-1) {
//                if number % i == 0 {
//                    return("Composite");
//                } // NOTE to SELF: for loop only reaches number minue one.
//            }
//        }
//        return ("Prime");
//    }
//
//    primeDeterminator(0);
//    primeDeterminator(1);
//    primeDeterminator(2);
//    primeDeterminator(3);
//    primeDeterminator(4);
//    primeDeterminator(5);

//-------------------------------------------------------------------------------



//-------------------------------------------------------------------------------

// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)

//    func fibPrime(number: Int) {
//        if number <= 0 {
//            println("Cannot proceed with your input")
//        } else {
//            for i in 1...number {
//                var nthFib:Int = generateNthFibonacci(i);
//                var nthPrimeOrNot:String = primeDeterminator(nthFib);
//            
//                println("\(i)th Fibonacci number is \(nthFib), and it is \(nthPrimeOrNot)")
//            }
//        }
//    }
//
//    fibPrime(20);
//
//// THIS FUNCTION REQUIRES generateNthFibonacci AND 
//// primeDetermination FUNCTIONS. DE-COMMENT.

//-------------------------------------------------------------------------------



//-------------------------------------------------------------------------------

// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).

// 01. My version of code
//
//    func calculateTip (bill:Double, optionalTip:Double?) {
//        if let tip = optionalTip {
//            var tipAmount = bill * tip;
//            println("Total bill amount is \(bill), and tip amount is \(tipAmount)")
//        } else {
//            println("Total bill amount is \(bill), and you are not tipping")
//        }
//    }
//
//    calculateTip(200, 0.5);
//    calculateTip(100, nil);

// 02. Travis version of code

//    func tipCalc(subTotal: Float, tip: Float?) -> (Float, Float) {
//        var total = subTotal;
//        var tipAmount: Float = 0; // default tip value is 0.
//    
//        if let t = tip {
//            tipAmount = subTotal * t;
//        }
//
//        total += tipAmount;
//    
//        return (total, tipAmount);
//    }
//
//    let tipResult = tipCalc(10, 0.2);
//    let t = tipResult.0; // sum of bill and top amounts
//    let tiptipTip = tipResult.1; // tip amount

/// ------------------------------------------------------------------->





//-------------------------------------------------------------------------------

// TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

func reverseString(textInput:String) -> String{
    var rev:String = "";
    let lengthOfTextInput:Int = countElements(textInput);
        // Detect the length of the string
    
    for j in 0...(lengthOfTextInput-1) {
        
        let ind = advance(textInput.startIndex, lengthOfTextInput-j-1)
        
        // NOTE: 
        //  01. "ind" is String.Index type -- not an Int type.
        //      It is due to Swift's Unicode support.
        //  02. "advance" method is used to get a character out of the string,
        //      one by one from back to front.
        
       rev = rev + String(textInput[ind]);
    }
    return rev;
}

reverseString("test");
reverseString("Longer Text");
reverseString("This is a longer sentence than the previous phrase.");

//

// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.



// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

func checkForPalindrome(text: String) {
    if text == reverseString(text) {
        println(text + " = " + reverseString(text));
        println(text + " is a palindrome");
    } else {
        println(text + " != " + reverseString(text));
        println(text + " is not a palindrome");
    }
}

checkForPalindrome("top");
checkForPalindrome("PoP");




// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings



// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.




