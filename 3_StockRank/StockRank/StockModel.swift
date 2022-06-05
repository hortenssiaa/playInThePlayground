//
//  StockModel.swift
//  StockRank
//
//  Created by joonwon lee on 2022/04/19.
//

import Foundation

struct StockModel {
    let rank: Int
    let imageName: String
    let name: String
    let price: Int
    let diff: Double
}

extension StockModel {
    static let list: [StockModel] = [
        StockModel(rank: 1, imageName: "TSLA", name: "TESLA", price: 1_238_631, diff: 0.04),
        StockModel(rank: 2, imageName: "AAPL", name: "APPLE", price: 238_631, diff: 1.04),
        StockModel(rank: 3, imageName: "NFLX", name: "NETFLIX", price: 438_631, diff: -0.04),
        StockModel(rank: 4, imageName: "GOOG", name: "ALPHABET A", price: 3_176_631, diff: 0.04),
        StockModel(rank: 5, imageName: "AMZN", name: "AMAZON", price: 3_538_631, diff: 0.04),
        StockModel(rank: 6, imageName: "NIKE", name: "NIKE", price: 158_631, diff: 0.04),
        StockModel(rank: 7, imageName: "DIS", name: "DISNEY", price: 138_631, diff: 0.04),
        StockModel(rank: 8, imageName: "TSLA", name: "TESLA", price: 1_238_631, diff: 0.04),
        StockModel(rank: 9, imageName: "AAPL", name: "APPLE", price: 238_631, diff: 1.04),
        StockModel(rank: 10, imageName: "NFLX", name: "NETFLIX", price: 438_631, diff: -0.04),
        StockModel(rank: 11, imageName: "GOOG", name: "ALPHABET A", price: 3_176_631, diff: 0.04),
        StockModel(rank: 12, imageName: "AMZN", name: "AMAZON", price: 3_538_631, diff: 0.04),
        StockModel(rank: 13, imageName: "NIKE", name: "NIKE", price: 158_631, diff: 0.04),
        StockModel(rank: 14, imageName: "DIS", name: "DISNEY", price: 138_631, diff: 0.04),
    ]
}
