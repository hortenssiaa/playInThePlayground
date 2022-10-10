//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by Hakyung Sohn on 2022/10/10.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ imageName: String) {
        profileImageView.image = UIImage(systemName: "pawprint.circle.fill")
        nameLabel.text = "National Geographic"
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
