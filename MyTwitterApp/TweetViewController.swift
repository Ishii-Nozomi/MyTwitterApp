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
    
    let textView: TweetTextView = {
        let textView = TweetTextView()
        textView.placeHolderLabel.text = "いまどうしてる？"
        textView.font = .systemFont(ofSize: 18)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.placeholder = "ユーザー名"
        view.addSubview(textView)
        textView.frame = .init(x: 20, y: 150, width: view.frame.size.width, height: view.frame.size.height)
        textView.delegate = self

       
    }
    // キャンセルボタン
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension TweetViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            self.textView.placeHolderLabel.alpha = 1
        } else {
            self.textView.placeHolderLabel.alpha = 0
        }
    }
}

