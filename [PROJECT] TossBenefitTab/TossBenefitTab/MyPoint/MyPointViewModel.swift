//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/20/24.
//

import Foundation

final class MyPointViewModel {
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
}
