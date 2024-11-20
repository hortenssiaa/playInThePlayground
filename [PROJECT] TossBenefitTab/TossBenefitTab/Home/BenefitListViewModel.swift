//
//  BenefitListViewModel.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/19/24.
//

import Foundation

final class BenefitListViewModel {
    @Published var todaySectionItems: [AnyHashable] = []
    @Published var otherSectionItems: [AnyHashable] = []
    
    // input, output - user interaction
    func fetchItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItems = TodaySectionItem(point: .default, benefit: .today).sectionItems
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.otherSectionItems = Benefit.others
        }
    }
}
