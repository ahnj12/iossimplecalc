//
//  ViewController.swift
//  iossimplecalc
//
//  Created by Jooneil Ahn on 10/22/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ("\(value)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultLabel: UILabel!


    var value : Double = 0.0
    var currNumb : Double = 0.0
    var currOp : String = ""
    var prevOp : String = ""
    var numbers = [Double]()
    
    @IBAction func pressNum(sender: UIButton) {
        currNumb = currNumb * 10 + Double(sender.titleLabel!.text!)!
        resultLabel.text = String(currNumb)
        
    }
    
    @IBAction func operation(sender: UIButton) {
        if prevOp == "avg" || prevOp == "count" {
            if prevOp != currOp {
                print("Must use same operator when using avg or count")
            }
        }
        currOp = sender.titleLabel!.text!
        numbers.append(currNumb)
        if currOp == "=" {
            switch prevOp {
            case "+":
                value = numbers[0] + numbers[1]
            case "-":
                value = numbers[0] - numbers[1]
            case "/":
                value = numbers[0] / numbers[1]
            case "mod":
                value = numbers[0] % numbers[1]
            case "count":
                value = Double(numbers.count)
            case "avg":
                var sum : Double = 0
                for i in 1...numbers.count {
                    sum += numbers[i - 1]
                }
                value = sum / Double(numbers.count)
            case "X":
                value = numbers[0] * numbers[1]
            default:
                print("error")
            }
            resultLabel.text = String(value)
            reset()
        } else if currOp == "fact" {
            if numbers.count > 1 {
                print("Factorials only accept one number")
                exit(1)
            }
            var factSum : Double = numbers[0]
            for var j = (numbers[0] - 1); j > 0; j--  {
                factSum *= j
            }
            value = factSum
            resultLabel.text = String(value)
            reset()
        } else {
            prevOp = currOp
            currNumb = 0
            resultLabel.text = String(currNumb)
        }
        
    }

    func reset() {
        prevOp = ""
        currOp = ""
        value = 0
        currNumb = 0
        numbers.removeAll()
    }
}

