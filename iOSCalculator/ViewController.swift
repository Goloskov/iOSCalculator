//
//  ViewController.swift
//  iOSCalculator
//
//  Created by Admin on 05.07.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var numberOnScreen: Double = 0
    var enteredNumber = false
    var previousNumber: Double = 0
    var operation = 0
    @IBAction func numbers(_ sender: UIButton) {
        
        if enteredNumber == true
         {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            enteredNumber = false
            
        }
         else
         {
             label.text = label.text! + String (sender.tag-1)
             numberOnScreen = Double (label.text!)!
         }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
         {
            previousNumber = Double(label.text!)!
            if (sender.tag == 12)
             {
                label.text = "/"
               
             }
             else if (sender.tag == 13)
             {
                label.text = "x"
           
             }
             else if (sender.tag == 14)
             {
                label.text = "-"
             
             }
             else if (sender.tag == 15)
             {
                label.text = "+"
                
             }
             operation = sender.tag
             enteredNumber = true
         }
        else if sender.tag == 16
        {
            if operation == 12
            {
                if numberOnScreen != 0
                {
                    label.text = String (previousNumber / numberOnScreen)
                }
                else if numberOnScreen == 0
                {
                    label.text = "Ошибка"
                    previousNumber = 0;
                    numberOnScreen = 0;
                    operation = 0;
                }
            }
            else if operation == 13
            {
                label.text = String (previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String (previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String (previousNumber + numberOnScreen)
            }
            
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
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

