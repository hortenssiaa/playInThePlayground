//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by Hakyung Sohn on 2022/10/10.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
