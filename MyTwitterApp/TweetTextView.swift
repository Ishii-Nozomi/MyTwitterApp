//
//  TweetTextView.swift
//  MyTwitterApp
//
//  Created by NOZOMI ISHII on 2023/03/01.
//

import Foundation
import UIKit

class TweetTextView: UITextView {
    
    public let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        addSubview(placeHolderLabel)
        
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        let cons = [
            placeHolderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            placeHolderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
            ]
        
        NSLayoutConstraint.activate(cons)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
