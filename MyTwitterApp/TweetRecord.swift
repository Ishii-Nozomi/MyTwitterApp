//
//  TweetRecord.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/03/05.
//

import Foundation
import RealmSwift

class TweetRecord: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var tweet: String = ""
}
