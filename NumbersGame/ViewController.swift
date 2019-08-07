//
//  ViewController.swift
//  NumbersGame
//
//  Created by 金田祐作 on 2019/08/06.
//  Copyright © 2019 金田祐作. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var rand:Int = Int.random(in: 1...100)
    var gameCounter:Int = 0
    //決定ボタンを押した時の処理
    @IBAction func NumberButton(_ sender: Any) {
       
        let col:String = String(InputText.text!)

        if (ValidCheck(val:col)) {
            ShowInput(col1:col)
            //SetText(value:col)
            gameCounter += 1
            Compare(value:col)
        }  else {
            showAlert("1から100の整数を入力してください。")
            InputText.text = ""
        }
    }
    
    // show guess
    func ShowInput(col1:String) -> Void {
        VarNumber.text=InputText.text
        InputText.text=""
    }
    
    func ValidCheck(val: String) -> Bool {
        if (Int(val) == nil){
        return false
        } else if (Int(val)! > 100) {
         return false
        } else if (Int(val)! < 0) {
         return false
        } else {
       return true
        }
        
    }
    
    func SetText(value:String) -> Void {
        let val:String = value + "\n"
        SetResult.insertText(val)
    }
    
    func gameReset() {
        gameCounter = 0
        rand = Int.random(in: 1...100)
        VarNumber.text = "??"
    }
    
    func Compare(value:String) {
        let val:Int = Int(value)!
        if (rand > val) {
            SetText(value:"[第\(gameCounter)回目]答えは\(val)より大きい数字です。")
            showAlert("答えは\(val)より大きい数字です。")
        } else if (rand < val) {
            SetText(value:"[第\(gameCounter)回目]答えは\(val)より小さい数字です。")
            showAlert("答えは\(val)より小さい数字です。")
        } else if (rand == val) {
            SetText(value:"\(gameCounter)回目で正解しました!")
            showAlert("答えは\(val)です。\n答えをリセットしました！")
            gameReset()
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var VarNumber: UILabel!

    @IBOutlet weak var InputText: UITextField!
    
    @IBOutlet weak var SetResult: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

