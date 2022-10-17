//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 2022/10/17.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ info: QuickFocus) {
        thumnailImageView.image = UIImage(named: info.imageName)
        titleLabel.text = info.title
        descriptionLabel.text = info.description
    }
}
