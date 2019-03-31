//
//  ViewController.swift
//  Calculator
//
//  Created by 安西佑介 on 2019/03/31.
//  Copyright © 2019 安西佑介. All rights reserved.
//

import UIKit

enum Operator {
    case undefined
    case addition
    case subtraction
    case multiplication
    case division
}

class ViewController: UIViewController {
    var firstValue = 0
    var secondValue = 0
    var currentOperator = Operator.undefined

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        var value = 0
        switch sender.currentTitle! {
        case "0":
            value = 0
        case "1":
            value = 1
        case "2":
            value = 2
        case "3":
            value = 3
        case "4":
            value = 4
        case "5":
            value = 5
        case "6":
            value = 6
        case "7":
            value = 7
        case "8":
            value = 8
        case "9":
            value = 9
        default:
            value = 0
        }
        if currentOperator == .undefined {
            firstValue = firstValue * 10 + value
            label.text = "\(firstValue)"
        } else {
            secondValue = secondValue * 10 + value
            label.text = "\(secondValue)"
        }
    }
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "+":
            currentOperator = .addition
        case "-":
            currentOperator = .division
        case "×":
            currentOperator = .multiplication
        case "÷":
            currentOperator = .division
        default:
            currentOperator = .undefined
        }
    }
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var value = 0
        switch currentOperator {
        case .addition:
            value = firstValue + secondValue
        case .subtraction:
            value = firstValue - secondValue
        case .multiplication:
            value = firstValue * secondValue
        case .division:
            value = firstValue / secondValue
        case .undefined:
            value = firstValue
        }
        label.text = "\(value)"
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
    }
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
        label.text = "0"
    }
}

