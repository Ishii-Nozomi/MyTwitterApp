//
//  TimelineViewController.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/02/18.
//

import Foundation
import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
   
    @IBOutlet weak var TweetSetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(TimelineTableViewCell.self, forCellReuseIdentifier: "cell")
        configureButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    @IBAction func tweetSetButton(_ sender: Any) {
        let tweetViewController = TweetViewController()
        present(tweetViewController, animated: true)
    }
    
    
    func configureButton() {
        TweetSetButton.layer.cornerRadius = TweetSetButton.bounds.width / 2
    }
    
    
}

extension TimelineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TimelineTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.nameLabel?.text = "ユーザー名"
        cell.textView?.text = "ツイート内容"
        return cell
    }
}
 extension TimelineViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
     }
 }
