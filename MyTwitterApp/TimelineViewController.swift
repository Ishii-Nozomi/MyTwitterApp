//
//  TimelineViewController.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/02/18.
//

import Foundation
import UIKit
import RealmSwift

class TimelineViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
   
    @IBOutlet weak var TweetSetButton: UIButton!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableview.register(TimelineTableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        configureButton()
        
        let userData = realm.objects(TweetRecord.self)
        print("全データ\(userData)")
        tableview.estimatedRowHeight = 50
        tableview.rowHeight = UITableView.automaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
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
        let userData = realm.objects(TweetRecord.self)
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TimelineTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as? TimelineTableViewCell
        else {
            return UITableViewCell()
        }
        let userDataList = realm.objects(TweetRecord.self)
        cell.nameLabel?.text = userDataList[indexPath.row].username
        cell.textView?.text = userDataList[indexPath.row].tweet
        return cell
    }
}
 extension TimelineViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
     }
 }
