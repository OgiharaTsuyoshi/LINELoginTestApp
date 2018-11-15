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
    
    var displayName = String()
    var pictureURL = String()
    var pictureUrlString = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        LineSDKLogin.sharedInstance().delegate = self
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        LineSDKLogin.sharedInstance().start()
    }
    
    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        if error != nil {
            print(error.debugDescription)
            return
        }
        
        //dispName
        if let displayName = profile?.displayName {
            self.displayName = displayName
        }
        //profilePic
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
