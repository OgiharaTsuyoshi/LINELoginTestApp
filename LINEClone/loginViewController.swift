//
//  loginViewController.swift
//  LINEClone
//
//  Created by 荻原剛志 on 2018/11/15.
//  Copyright © 2018 OgiharaTsuyoshi. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet var loginView: UIView!
    @IBOutlet var lineButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    
    var displayName = String()
    var pictureURL = String()
    var pictureUrlString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        //SNSログイン画面のボタンを丸角にする
        lineButton.layer.cornerRadius = lineButton.frame.width * 0.5
        facebookButton.layer.cornerRadius = facebookButton.frame.width * 0.5
        twitterButton.layer.cornerRadius = twitterButton.frame.width * 0.5
        
        //LINEログイン処理のdelegateを設定
        
        
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        //LINEのログイン処理を追記する
    }
    
    //ログインした際の処理を追記する
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC:ViewController = segue.destination as! ViewController
        //TimeLineの遷移先へ取得したdisplayNameとpictureUrlStringを渡す
        VC.displayName = self.displayName
        VC.pictureUrlString = self.pictureUrlString
    }

}
