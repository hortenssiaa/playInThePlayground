//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/27/24.
//

import Foundation

final class DetailViewModel {
    
    var network: NetworkService
    var item: ItemInfo
    
    @Published var itemDetails: ItemInfoDetail?
    
    init(network: NetworkService, item: ItemInfo) {
        self.network = network
        self.item = item
    }
    
    func fetch() {
        // api가 없는 관계로.. 네트워크를 통해 비동기적으로 데이터가 받아와지는 시뮬레이팅
        // simulate network like behavior
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            self.itemDetails = ItemInfoDetail(
                user: User.mock,
                item: self.item,
                details: ItemExtraInfo.mock)
        })
        // 원래 행해져야하는 네트워크 작업
        // let resource = Resource(base: <#T##String#>, path: <#T##String#>)
        // network.load(resource)
        //     .receive(on: )
    }
}
