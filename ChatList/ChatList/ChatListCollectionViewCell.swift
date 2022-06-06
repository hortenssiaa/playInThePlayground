//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by Hakyung Sohn on 2022/06/06.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var chatLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    // view contrller에서, storyboard에서 만든 collection view cell을 스토리보드에서 하나씩 뽑아서(dequeueReusableCell) 쓰고 있는데
    // 스토리보드에서 꺼내올때, 처음에 호출되는 함수 :awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 꺼내와 질때, 미리 설정해 놓을 수 있는 것들 설정
        thumbnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLable.text = chat.name
        chatLable.numberOfLines = 2
        chatLable.text = chat.chat
        dateLable.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        // 2022-04-01 -> 4/1
        let formatted = DateFormatter()
        formatted.dateFormat = "yyyy-MM-dd"
        
        // date이 옵셔널이기 때문에, if-else를 설정헤줘야 한다
        if let date = formatted.date(from: dateString) {
            formatted.dateFormat = "M/d"
            return formatted.string(from: date)
        } else {
            return ""
        }
    }
}
