//
//  FocusCollectionViewCell.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 2022/10/12.
//

import UIKit

class FocusCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumnailImageView: UIImageView!
    
    override func awakeFromNib() {
        // cell file이 storyboard에서 깨어났을때
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ data: Focus) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        thumnailImageView.image = UIImage(systemName: data.imageName)?.withRenderingMode(.alwaysOriginal)
    }
}
