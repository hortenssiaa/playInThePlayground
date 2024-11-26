//
//  HomeViewModel.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/26/24.
//

import Foundation
import Combine

final class HomeViewModel {
    var network: NetworkService
    
    @Published var itemInfo: [ItemInfo] = []
    
    var itemTapped = PassthroughSubject<ItemInfo, Never>()
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func fetch() {
        let resource = Resource<[ItemInfo]>(
            base: "https://my-json-server.typicode.com/",
            path: "cafielo/demo/products",
            params: [ : ],
            header: ["Content-Type" : "application/json"]
        )
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(">>>> Network Error: \(error)")
                case .finished:
                    print(">>> Network Fetch Completed")
                }
            } receiveValue: { items in
                self.itemInfo = items
            }.store(in: &subscriptions)
    }
}
