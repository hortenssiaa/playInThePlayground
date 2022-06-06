//
//  Chat.swift
//  ChatList
//
//  Created by joonwon lee on 2022/04/20.
//

import Foundation

struct Chat {
    let name: String
    let chat: String
    let date: String
}

extension Chat {
    static let list: [Chat] = [
        Chat(name: "brian", chat: "🔥 감사합니다. 아 그리고, 이번 생일 축하합니다. 만나서 반가웠어요", date: "2022-03-01"),
        
        Chat(name: "hakyung", chat: "❤️ 어제 도와줘서 고마워. 그래도 다행이야, 너가 빠르게 회복되었다니까", date: "2022-03-14"),
        
        Chat(name: "flower shop", chat: "🌸 아카시아 꽃이 피는 시즌인가봐요, 오랜만에 꽃집 다녀와서 너무 기분이 좋았어요.", date: "2022-03-01"),
        
        Chat(name: "sera", chat: "🛍 誕生日プレゼント何が欲しい？ショッピング行かない？ ", date: "2022-03-02"),
        Chat(name: "mini", chat: "💡 지난번 제 대신에 일처리 해주셔서 감사합니다. 우리팀 칭찬 노트에 추천해드릴게요 ><", date: "2022-03-02"),
        Chat(name: "stephanie", chat: "🔥 감사해요, 담에 또 연락주세요, 그럼 어서 좋은 주말되세요 ㅋㅋ", date: "2022-03-02"),
        Chat(name: "wine shop", chat: "🍷 この前購入してくださったロマネコンティワインはいかがでしたか。 今回新しく入った最高級ワインがあります。 必要でしたらご連絡ください。 ", date: "2022-03-10"),
        
        Chat(name: "plant shop", chat: "🆕 새로운 킹고나무가 입고되었습니다.", date: "2022-03-11"),
        
        Chat(name: "sam", chat: "🙅‍♂️ Sam. What's wrong with you man,,,?", date: "2022-03-12"),
        
        Chat(name: "john", chat: "☀️ it is sunny day. let's get out..", date: "2022-03-13"),
        
    ]
}

