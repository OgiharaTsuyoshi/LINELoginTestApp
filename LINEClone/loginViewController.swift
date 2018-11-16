//
//  loginViewController.swift
//  LINEClone
//
//  Created by 荻原剛志 on 2018/11/15.
//  Copyright © 2018 OgiharaTsuyoshi. All rights reserved.
//

import UIKit
import LineSDK

class loginViewController: UIViewController, LineSDKLoginDelegate {
    
    @IBOutlet var loginView: UIView!
    @IBOutlet var lineButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    
    var displayName = String()
    var pictureURL = String()
    var pictureUrlString = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        LineSDKLogin.sharedInstance().delegate = self
        lineButton.layer.cornerRadius = lineButton.frame.width * 0.5
        facebookButton.layer.cornerRadius = facebookButton.frame.width * 0.5
        twitterButton.layer.cornerRadius = twitterButton.frame.width * 0.5
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        LineSDKLogin.sharedInstance().start()
    }
    
    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        if error != nil {
            print(error.debugDescription)
            return
        }
        
        //LineSDKProfileクラスのdisplayNameプロパティからユーザーネームを取得
        if let displayName = profile?.displayName {
            self.displayName = displayName
        }
        //上記と同様 プロフィールメディアURLをStringに変換
        if let pictureURL = profile?.pictureURL {
            self.pictureUrlString = pictureURL.absoluteString
        }
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC:ViewController = segue.destination as! ViewController
        
        VC.displayName = self.displayName
        VC.pictureUrlString = self.pictureUrlString
    }

}
