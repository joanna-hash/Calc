//
//  ViewController.swift
//  exam1-kgy
//
//  Created by 김가영 on 2020/07/09.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var started:Bool = false
    var firstOperand:Int = 0
    var secondOperand:Int = 0
    var calcOperator:String = ""
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        started = false
        self.activity.stopAnimating()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonStart() {
    started = true
     self.activity.startAnimating()
    result.text! = "계산 시작"
    display.text! = "0"
        
    }
    
    @IBAction func buttonNumber(_ sender: UIButton) {
        let entered: String! = sender.titleLabel!.text
        //let current: String! = display.text
        if self.activity.isAnimating == false {
            result.text! = "계산시작 버튼을 먼저 누르세요"
        }
        else if self.activity.isAnimating == true {
            if display.text == "0" && entered == "0" //현재 0이고 누른 버튼이 0일때
                        {
                        display.text = "0"
                    }
                        else if entered == "C" //c 눌렀을 때
                        {
                            display.text = "0"
                }
                        else //0아닌 레이블 눌렀을 때 하나씩 추가됨
                        {
                            if display.text == "0" //현재 0이라면
                            {
                                display.text! = entered //0이 누른버튼으로 바뀜
                            }
                            else { //현재 0이 아니라면
                            display.text! += entered //현재에 누른버튼이 추가됨
                            }
                        }
        }
    }
    
    
    @IBAction func buttonOperator(_ sender: UIButton) {
        //let ope: String! = display.text
        let entered: String! = sender.titleLabel!.text
        var first = String(firstOperand)
        
        if self.activity.isAnimating == false{
            result.text! = "계산시작 버튼을 먼저 누르세요"
        }
            if entered == "+"{
                first = display.text!
                firstOperand = Int(first)!
                result.text = first + "+"
                display.text! = "0"
                calcOperator = "+"
            }
           else if entered == "-"{
                 first = display.text!
                 firstOperand = Int(first)!
              result.text = display.text! + "-"
                display.text! = "0"
                  calcOperator = "-"
            }
           else if entered == "*"{
                 first = display.text!
                firstOperand = Int(first)!
                result.text = display.text! + "*"
                display.text! = "0"
                  calcOperator = "*"
           }
            else if entered == "/"{
                 first = display.text!
                firstOperand = Int(first)!
                result.text = display.text! + "/"
                display.text! = "0"
                 calcOperator = "/"
            }
    }
    
    
    @IBAction func buttonEqual() {

        var second = String(secondOperand)
        
        if self.activity.isAnimating == false{
            result.text! = "계산시작 버튼을 먼저 누르세요"
        }
       if calcOperator == "+"{
         second = display.text!
        secondOperand = Int(second)!
             self.activity.stopAnimating()
        result.text! += second + "=" + String(firstOperand+secondOperand)
        display.text! = String(firstOperand+secondOperand)
         }
        else if calcOperator == "-"{
        second = display.text!
        secondOperand = Int(second)!
             self.activity.stopAnimating()
          result.text! += second + "=" + String(firstOperand-secondOperand)
        display.text! = String(firstOperand+secondOperand)
         }
        else if calcOperator == "*"{
        second = display.text!
        secondOperand = Int(second)!
             self.activity.stopAnimating()
             result.text! += second + "=" + String(firstOperand*secondOperand)
        display.text! = String(firstOperand+secondOperand)
        }
         else if calcOperator == "/"{
        second = display.text!
        secondOperand = Int(second)!
             self.activity.stopAnimating()
             result.text! += second + "=" + String(firstOperand/secondOperand)
        display.text! = String(firstOperand+secondOperand)
         }
        
 
    }
    
}

