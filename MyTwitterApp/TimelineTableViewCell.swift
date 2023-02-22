//
//  TimelineTableViewCell.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/02/22.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

    // ユーザー名を表示するUILabel
    @IBOutlet weak var nameLabel: UILabel!
    
    // ツイート内容を表示するUITextView
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
