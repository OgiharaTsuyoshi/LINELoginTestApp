//
//  ViewController.swift
//  LINELoginTest
//
//  Created by 荻原剛志 on 2018/11/15.
//  Copyright © 2018 OgiharaTsuyoshi. All rights reserved.
//

import UIKit
import LineSDK
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    //つぶやきの配列
    var tweetArray = [String]()
    //入力したつぶやきをcellで表示
    var label: UILabel = UILabel()
    //LINEから取得したデータ格納用
    var displayName = String()
    var pictureUrlString = String()
    //選択したcellの番号を入れる
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cellの幅を動的に調整
        self.tableView.estimatedRowHeight = 102
        self.tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "array") != nil {
            tweetArray = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        tableView.reloadData()
        
        
    }
    //キーボードのreturnが押下された時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tweetArray.append(textField.text!)
        UserDefaults.standard.set(tweetArray, forKey: "array")
        if UserDefaults.standard.object(forKey: "array") != nil {
            tweetArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
            textField.text = ""
            tableView.reloadData()
            print(tweetArray)
        }
        
        //キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //SDWebImageを用いてURLから画像を取得しcellの生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        cell.userImageView.sd_setImage(with: URL(string: pictureUrlString))
        cell.userImageView.layer.cornerRadius = cell.userImageView.frame.width * 0.5
        cell.userNameLabel.text = displayName
        label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = tweetArray[indexPath.row]
        label.sizeToFit()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cellがタップされた時タップしたcellの番号を保持
        count = Int(indexPath.row)
        performSegue(withIdentifier: "next", sender: nil)
    }
    //スワイプで削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tweetArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(tweetArray, forKey: "array")
        }
    }
    
    //遷移先に値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let sendToLineVC:sendToLineViewController = segue.destination as! sendToLineViewController
            sendToLineVC.selectedNumber = count
            sendToLineVC.displayName = self.displayName
            sendToLineVC.pictureUrlString = self.pictureUrlString
        }
    }
    
    
}


