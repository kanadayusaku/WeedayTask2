//
//  ViewController.swift
//  NumbersGame
//
//  Created by 金田祐作 on 2019/08/06.
//  Copyright © 2019 金田祐作. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    //正解となる数字を1～100の整数からランダムで生成
    var rand:Int = Int.random(in: 1...100)
    //回答した回数
    var gameCounter:Int = 0
    //決定ボタンを押した時の処理
    @IBAction func NumberButton(_ sender: Any) {
       
        //テキストボックスに入力された値をStringにキャスト
        let col:String = String(InputText.text!)

        //入力内容のバリデーションチェック開始
        if (ValidCheck(val:col)) {
            ShowInput(col1:col)
           //回答数を1追加
            gameCounter += 1
            //正解の数字と比較
            Compare(value:col)
        }  else {
            showAlert("1から100の整数を入力してください。")
            //テキストボックスの中身を初期化
            InputText.text = ""
        }
    }
    
     // 予想した数字を入力
    func ShowInput(col1:String) -> Void {
        VarNumber.text=InputText.text
        InputText.text=""
    }
    
    //入力内容のバリデーションチェック
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
    
    //TextViewに結果を表示
    func SetText(value:String) -> Void {
        let val:String = value + "\n"
        SetResult.insertText(val)
    }
    
    //クイズのリセット
    func gameReset() {
        gameCounter = 0
        rand = Int.random(in: 1...100)
        VarNumber.text = "??"
    }
    
    //回答した数字の正誤判断
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
    
    //アラート内容、ボタンを推した時の処理
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var VarNumber: UILabel!

    @IBOutlet weak var InputText: UITextField!
    
    @IBOutlet weak var SetResult: UITextView!
    
    
  
}

