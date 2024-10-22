//
//  ResultCell.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var user: UILabel!
    
    func configure(_ user: String) {
        self.user.text = user
    }
}
