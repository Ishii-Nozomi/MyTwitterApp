//
//  TweetViewController.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/02/25.
//

import UIKit
import RealmSwift

class TweetViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var tweetButton: UIButton!
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var tweetText: TweetTextView!
    
    let realm = try! Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.placeholder = "ユーザー名"
        self.userNameText.keyboardType = .twitter
        self.tweetText.keyboardType = .twitter
        self.tweetText.delegate = self

       
    }
    
    override func viewDidLayoutSubviews() {
        tweetText.placeHolderLabel.text = "いまどうしてる？"
        tweetText.placeHolderLabel.isHidden = false
        tweetText.layer.borderWidth = 1
        tweetText.layer.borderColor = UIColor.lightGray.cgColor
        tweetText.layer.cornerRadius = 3
    }
    
    // キャンセルボタン
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        let tweet = TweetRecord()
        tweet.username = userNameText.text!
        tweet.tweet = tweetText.text!
        do {
            try realm.write {
                realm.add(tweet)
            }
        } catch {
            print("Error\(error)")
        }
        
        dismiss(animated: true, completion: nil)
    }
}

extension TweetViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            self.tweetText.placeHolderLabel.alpha = 1
        } else {
            self.tweetText.placeHolderLabel.alpha = 0
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 140
    }
}

