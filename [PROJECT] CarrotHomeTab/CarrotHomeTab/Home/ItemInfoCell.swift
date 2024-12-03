//
//  ItemInfoCell.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/26/24.
//

import UIKit
import Kingfisher

class ItemInfoCell: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var numOfChat: UILabel!
    @IBOutlet weak var numOfHeart: UILabel!
    
    // reuse cell 할때, storyboard가 깨어나는데, 그때 불리는 메소드
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
        thumbnail.layer.masksToBounds = true
        thumbnail.tintColor = .systemGray
    }
    
    func configure(items: ItemInfo) {
        self.titleLable.text = items.title
        self.descriptionLable.text = items.location
        self.priceLable.text = "\(formatNumber(items.price))원"
        self.numOfChat.text = "\(items.numOfChats)"
        self.numOfHeart.text = "\(items.numOfLikes)"
        
        let url = URL(string: items.thumbnailURL)!
        self.thumbnail.kf.setImage(
            with: url,
            placeholder: UIImage(named: "tv")
//            placeholder: UIImage(systemName: "hands.sparkles.fill")
        )
    }
    
    func formatNumber(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let result = formatter.string(from: NSNumber(integerLiteral: price)) ?? ""
        return result
    }
}
