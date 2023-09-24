//
//  ViewController.swift
//  BootcampOdev5
//
//  Created by Erbil Can on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        labelSonuc.text = ""
    }
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            labelSonuc.text = String(sender.tag-1)
            numberOnScreen = Double(labelSonuc.text!)!
            performingMath = false
        }else {
            labelSonuc.text = labelSonuc.text! + String(sender.tag-1)
            numberOnScreen = Double(labelSonuc.text!)!
        }
    }
    @IBAction func buttons(_ sender: UIButton) {
        if labelSonuc.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(labelSonuc.text!)!
            if sender.tag == 12 { //Divide
                labelSonuc.text = "/";
            }
            if sender.tag == 13 { //Multiply
                labelSonuc.text = "x";
            }
            if sender.tag == 14 { //Subtract
                labelSonuc.text = "-";
            }
            if sender.tag == 15 { //Add
                labelSonuc.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16 {
            if operation == 12{ //Divide
                labelSonuc.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{ //Multiply
                labelSonuc.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{ //Subtract
                labelSonuc.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{ //Add
                labelSonuc.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11{
            labelSonuc.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
}


