//
//  sendToLineViewController.swift
//  LINELoginTest
//
//  Created by 荻原剛志 on 2018/11/15.
//  Copyright © 2018 OgiharaTsuyoshi. All rights reserved.
//

import UIKit
import LineSDK
import SDWebImage

class sendToLineViewController: UIViewController {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    //選択したcellの番号
    var selectedNumber:Int = 0
    //つぶやきの配列
    var tweetArray:Array = [String]()
    //LINEから取得したデータ格納用
    var displayName = String()
    var pictureUrlString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "array") != nil {
            tweetArray = UserDefaults.standard.object(forKey: "array") as! [String]
            textLabel.text = tweetArray[selectedNumber]
            
            userImageView.sd_setImage(with: URL(string: pictureUrlString))
            userImageView.layer.cornerRadius = userImageView.frame.width * 0.5
            userNameLabel.text = displayName
        }
        
    }
    //URL Schemeでアプリを起動して送信
    @IBAction func sendToLine() {
        let lineSchemeMessage: String! = "line://msg/text/"
        var scheme: String! = lineSchemeMessage + "[つぶやきがPostされました]\n" + textLabel.text!
        //日本語を含むURLはエンコーディング
        scheme = scheme.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let messageURL: URL! = URL(string: scheme)
        UIApplication.shared.open(messageURL)
    }
    //戻るボタン
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
}

