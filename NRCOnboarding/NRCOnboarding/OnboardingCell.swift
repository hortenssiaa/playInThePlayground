//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by Hakyung Sohn on 2022/10/11.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageview.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLable.text = message.description
    }
}
