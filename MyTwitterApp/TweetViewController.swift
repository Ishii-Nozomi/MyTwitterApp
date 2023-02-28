//
//  TweetViewController.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/02/25.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var tweetButton: UIButton!
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var tweetText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // キャンセルボタン
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

