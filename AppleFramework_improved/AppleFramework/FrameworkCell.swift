//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 2022/10/06.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var frameworkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ framework: AppleFramework) {
        frameworkImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = "\(framework.name)"
    }
}
