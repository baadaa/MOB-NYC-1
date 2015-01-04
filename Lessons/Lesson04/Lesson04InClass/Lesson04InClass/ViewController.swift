import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func didSwipe(sender: AnyObject) {
        sampleLabel.text = "Swipped!"
    }
    
    @IBOutlet weak var sampleLabel: UILabel!

    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func didTapButton(sender: AnyObject) {
        
//        self.view.backgroundColor = UIColor.redColor();
       // sampleLabel.text = "Tapped!"
        
      //  let textFieldName = myTextField.text;
        
      //  sampleLabel.text = "Hello! \(textFieldName)"
   //     func generateNthFibonacci() {
            var val:Int! = myTextField.text.toInt();

            var f1:Int = 0;
            var f2:Int = 1;
            
            if val == 1 {
                sampleLabel.text = "0";
            } else if val == 2 {
                sampleLabel.text = "1";
            } else {
                
                var fib:Int = 0;
                for index in 3...val!{
                    fib = f1 + f2;
                    
                    f1 = f2;
                    f2 = fib;
                }
                sampleLabel.text = toString(fib);
                
            }
            
        }
        
    //    generateNthFibonacci();
        
  //  }
    
    
    
    // Functions of use for this exercise:
    // Translating a string to an integer: "1".toInt()
    // Getting the text from a text field: let text = textFieldName.text
    // Setting the text on a text label or text field: textLabelName.text = "some text"
    
    /*
    TODO: Create a text field, a label and a button in the storyboard's View Controller. Drag a new outlet from the label and text field to this file, then drag the 'touch up inside' event on the button into this file. When the button is clicked, make the text of the label display 'hello {whatever the text in the text field is}. Call an instructor/TA when you're done with this task.
    */
    
    /*
    TODO: Paste the fibonacci number function that you previously created into this class. Change the text box to use a numeric keypad for input. When the button is pressed, make the label print out the nth number in the fibonacci sequence (where n is the value of the text in the text field). Call an instructor/TA when you're done with this task.
    */

    
    
    
    
    
    /*
    TODO: Drag a new text field into the view controller, and create an outlet for it here. Make both text fields use the numeric keypad. One text field represents an optional tip percentage (in integer form, e.g 20 = 20% tip), the other represents the total amount of a bill. When the button is pressed, make the label display both the total amount and tip amount (e.g. "total: $100, tip: $15"). Call an instructor/TA when you're done with this task.
    */
}