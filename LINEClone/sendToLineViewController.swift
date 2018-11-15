//
//  sendToLineViewController.swift
//  LINELoginTest
//
//  Created by 荻原剛志 on 2018/11/15.
//  Copyright © 2018 OgiharaTsuyoshi. All rights reserved.
//

import UIKit

class sendToLineViewController: UIViewController, UITextViewDelegate,UIDocumentInteractionControllerDelegate {
    
    var selectedNumber:Int = 0
    @IBOutlet var textView: UITextView!
    
    var taskArray:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "array") != nil {
            taskArray = UserDefaults.standard.object(forKey: "array") as! [String]
            textView.text = taskArray[selectedNumber]
        }
        
    }
    
    @IBAction func sendToLine() {
        let lineSchemeMessage: String! = "line://msg/text/"
        var scheme: String! = lineSchemeMessage + "予定がPostされました！\n" + textView.text
        
        scheme = scheme.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let messageURL: URL! = URL(string: scheme)
        UIApplication.shared.open(messageURL)
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

