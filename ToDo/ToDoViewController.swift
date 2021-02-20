//
//  ToDoViewController.swift
//  ToDo
//
//  Created by Sallivan James on 2021/02/19.
//

import UIKit


//UITextFieldDelegate : TextFieldの編集やバリデーションを行いたい時に用いるメソッドの集まり
class ToDoViewController: UIViewController, UITextFieldDelegate {
    
    //ラベルの宣言
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    var dateTextField: UILabel!
    
    //ユーザデフォルトにアクセスするための倉庫を作成
    var saveDate: UserDefaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //datePickerの表示方法設定
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        //dateTextField.inputView = datePicker
        
        //Delegate機能の実装(デリゲートの所在はこのファイルですよ)
        titleTextField.delegate = self
        
        print("f")

        // Do any additional setup after loading the view.
    }
    
    
    
    //保存機能
    @IBAction func save(_ sender: Any){

        
        //項目名を変数に格納、その後フィールドを空にする
        todoTitle.append(titleTextField.text!)
        titleTextField.text = ""

        //日付を変数に格納
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        todoDate.append("\(formatter.string(from: Date()))")
        
        
        //userDefaultsへ書込
        saveDate.set(todoTitle, forKey: "title")
        saveDate.set(todoDate, forKey: "date")
        
        //ToDoViewController画面を閉じる
        self.dismiss(animated: true, completion: nil)
        print(todoTitle)
        print(todoDate)
        
        
        print("g")
        
        
    }
    
    
    
    //中断機能
    @IBAction func cancel(){
        
        //ToDoViewController画面を閉じる
        self.dismiss(animated: true, completion: nil)
        print("h")
    }
    
    
    
    //キーボード非表示機能
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //TextFieldのファーストレスポンダをやめる(キーボードが非表示になる)
        textField.resignFirstResponder()
        
        print("i")
        
        return true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
