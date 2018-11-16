//
//  sendToLineViewController.swift
//  LINELoginTest
//
//  Created by 荻原剛志 on 2018/11/15.
//  Copyright © 2018 OgiharaTsuyoshi. All rights reserved.
//

import UIKit
import SDWebImage

class sendToLineViewController: UIViewController {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    var tweetArray:Array = [String]()
    var selectedNumber:Int = 0
    
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
            userImageView.layer.cornerRadius = userImageView.frame.width * 0.5
            
            //LINEのユーザーネームとアイコンをImageViewとLabelに設定(追記)
        }
        
    }
    //LINEに投稿の処理を追記
    @IBAction func sendToLine() {
        
    }
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
}

