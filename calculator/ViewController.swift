//
//  ViewController.swift
//  calculator
//
//  Created by 片平駿介 on 2019/05/30.
//  Copyright © 2019 ShunsukeKatahira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonSubtraction: UIButton!
    @IBOutlet weak var buttonAddition: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var arithmeticLabel: UILabel!
    @IBOutlet weak var resultNumber: UILabel!
    
    var decimalCnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLayert()
    }
    
    // 数値ボタン押下時
    @IBAction func inputFormula(_ sender: UIButton) {
        
        if arithmeticLabel.text == ""{
            guard var formulaText = firstNumber.text else {
                return
            }
            guard let senderedText = sender.titleLabel?.text else {
                return
            }
            if formulaText == "0"{
                if senderedText == "0" {
                    return
                }
                if senderedText != "."{
                    formulaText = ""
                }
            }
            if senderedText == "."{
                decimalCnt = decimalCnt + 1
                if decimalCnt == 2 {
                    return
                }
            }
            
            firstNumber.text = formulaText + senderedText
        } else {
            guard var formulaText2 = secondNumber.text else {
                return
            }
            guard let senderedText2 = sender.titleLabel?.text else {
                return
            }
            if formulaText2 == "0"{
                if senderedText2 == "0" {
                    return
                }
                if senderedText2 != "."{
                    formulaText2 = ""
                }
            }
            secondNumber.text = formulaText2 + senderedText2
        }
    }
    
    // 演算子ボタン押下時
    @IBAction func inputOperator(_ sender: UIButton) {
        guard let senderedText = sender.titleLabel?.text else {
            return
        }
        arithmeticLabel.text = senderedText
    }
    
    // =ボタン押下時
    @IBAction func inputResult(_ sender: Any) {
        let firstNum = atof(firstNumber.text)
        let secondNum = atof(secondNumber.text)
        let symbol = arithmeticLabel.text
        var result = 0.0;
        
        switch symbol {
        case "＋":
            result = firstNum + secondNum
        case "−":
            result = firstNum - secondNum
        case "×":
            result = firstNum * secondNum
        case "÷":
            result = firstNum / secondNum
        default:
            return
        }
        
        
        resultNumber.text = String(result)
    }
    
    
    @IBAction func clickAC(_ sender: Any) {
        firstNumber.text = "0"
        secondNumber.text = ""
        arithmeticLabel.text = ""
        resultNumber.text = ""
    }
}

extension ViewController {
    func buttonLayert() {
        
        button0.layer.borderColor = UIColor.blue.cgColor
        button0.layer.borderWidth = 1.0
        button0.layer.cornerRadius = 10.0
    }
}

