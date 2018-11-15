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
    
    
    var taskArray = [String]()
    var label: UILabel = UILabel()
    var displayName = String()
    var pictureUrlString = String()
    //選択したcellの番号を入れる
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "array") != nil {
            taskArray = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        tableView.reloadData()
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskArray.append(textField.text!)
        UserDefaults.standard.set(taskArray, forKey: "array")
        if UserDefaults.standard.object(forKey: "array") != nil {
            taskArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
            textField.text = ""
            tableView.reloadData()
            print(taskArray)
        }
        
        
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        cell.userimageView.sd_setImage(with: URL(string: pictureUrlString))
        cell.userimageView.layer.cornerRadius = 8.0
        cell.imageView?.clipsToBounds = true
        cell.userNameLabel.text = displayName
        label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = taskArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cellがタップされた時
        count = Int(indexPath.row)  //タップしたcellの番号
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(taskArray, forKey: "array")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let sendToLineVC:sendToLineViewController = segue.destination as! sendToLineViewController
            sendToLineVC.selectedNumber = count
        }
    }
    
    
}


