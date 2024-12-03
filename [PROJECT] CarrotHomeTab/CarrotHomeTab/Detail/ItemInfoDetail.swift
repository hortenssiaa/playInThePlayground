//
//  ItemInfoDetail.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/27/24.
//

import Foundation

struct ItemInfoDetail: Codable {
    let user: User
    let item: ItemInfo
    let details: ItemExtraInfo
}

struct User: Codable {
    let name: String
    let thumbnail: String
    let location: String
    let temperature: Int
}

struct ItemExtraInfo: Codable {
    let itemThumbnail: [String]
    let description: String
}

extension User {
    static let mock = User(
        name: "텐샤",
        thumbnail: "jubilee",
        location: "분당구 판교동",
        temperature: 46)
}

extension ItemExtraInfo {
    static let mock = ItemExtraInfo(
        itemThumbnail: ["bracelet"],
        description: "쿠팡에서 직접매입해 판매하는 애플 정품입니다.\n 22년 2월제조 입니다. \n판교동직거래")
}
