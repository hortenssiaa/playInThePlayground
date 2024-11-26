//
//  CustomBarItem.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/25/24.
//

import Foundation
import UIKit

struct CustomBarItemConfiguration {
    // 표현이 복잡하거나 / 한눈에 보기 어려운 경우 typealias 로 정의
    typealias Handler = () -> Void
    
    var title: String?
    var image: UIImage?
    var handler: Handler
    
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}

final class CustomBarItem: UIButton {
    // UIBarButtonItem 필수 구성: title, image, action
    var customBarItemConfig: CustomBarItemConfiguration
    
    init(config: CustomBarItemConfiguration) {
        self.customBarItemConfig = config
        super.init(frame: .zero)
        setupStyle()
        updateConfig() // title, image
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // action
    }
    
    private func updateConfig() {
        self.setTitle(customBarItemConfig.title, for: .normal)
        self.setImage(customBarItemConfig.image, for: .normal)
    }
    
    private func setupStyle() {
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .white
        self.imageView?.tintColor = .white
    }
    
    @objc func buttonTapped() {
        customBarItemConfig.handler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
