//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 2022/10/17.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    } 
}
