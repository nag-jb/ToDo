//
//  ViewController.swift
//  ToDo
//
//  Created by Sallivan James on 2021/02/19.
//

import UIKit
//データを表示するための格納箱
var todoTitle = [String]()
var todoDate = [String]()
//UITableViewDataSource : プロトコルでTableViewを使う際に用いる
class ViewController: UIViewController, UITableViewDataSource{

    @IBOutlet var table: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        if UserDefaults.standard.object(forKey: "title") != nil {
            todoTitle = UserDefaults.standard.object(forKey: "title") as! [String]
            todoDate = UserDefaults.standard.object(forKey: "date") as! [String]
        }
        //self.table.dataSource = self
        
        print("a")
    }
    
    //reload
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        
        print("0")
    }
    
    
    
    //セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        print("c")
        return todoTitle.count
        
    }
    
    
    //ID付きのセルを取得し、データを代入
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        //変数を作成
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //変数の中身を作成、セルにToDo項目と日付を表示
        cell.textLabel?.text = todoTitle[indexPath.row] + todoDate[indexPath.row]
        
        print("d")
        
        return cell
    }
    
    
    
    //スワイプしたセルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            todoTitle.remove(at: indexPath.row)
            todoDate.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            //userDefaultsへ書込
            UserDefaults.standard.set(todoTitle, forKey: "title")
            UserDefaults.standard.set(todoDate, forKey: "date")
        }
        

        print("e")
        print(todoTitle)
        print(todoDate)
    }


}

