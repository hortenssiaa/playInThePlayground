//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by Hakyung Sohn on 2022/06/05.
//

import UIKit

// 내가 만든 custom cell은, 소스파일을 별도로 만들어 줘야함
class StockRankCollectionViewCell: UICollectionViewCell {
    
    // connecting ui components
    // inserting data in ui components
    
    @IBOutlet weak var rankLable: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLable: UILabel!
    @IBOutlet weak var companyPriceLable: UILabel!
    @IBOutlet weak var diffLable: UILabel!
    
    // StockModel 타입의 인자를받아서, 업데이트
    func configure(_ stock: StockModel) {
        rankLable.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLable.text = stock.name
        companyPriceLable.text = "\(converToCurrencyFormat(price: stock.price)) 원"
        
        diffLable.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLable.text = "\(stock.diff) %"
    }
    
    func converToCurrencyFormat(price: Int) -> String {
         // NumberFormatter() : number formatting object
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal // 3자리로 끊기
        numberFormatter.maximumFractionDigits = 0 // 소수점을 어떻게 표현할건지
        // let result = numberFormatter.string(from: NSNumber(value: price))!
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
        // -> not to occure crashes by !
        // -> to deal with 'optinoal', better use return empty String (?? "")
    }
}
