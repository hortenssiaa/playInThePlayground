//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/18/24.
//

import UIKit
import Combine

class ButtonBenefitViewController: UIViewController {
    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var vStackView: UIStackView!
    
    var viewModel: ButtonBenefitViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        viewModel.fetchDetails()
    }
    
    private func bind() {
        viewModel.$benefit
            .receive(on: RunLoop.main)
            .sink { benefit in
                self.ctaButton.setTitle(benefit.ctaTitle, for: .normal)
            }.store(in: &subscriptions)
        
        viewModel.$benefitDetails
            .compactMap { $0 } // ButtonBenefitViewModel 의 benefitDetails 가 optional type 이기 때문에
            .receive(on: RunLoop.main)
            .sink { details in
                self.addGuides(details: details)
            }.store(in: &subscriptions)
    }
    
    private func setupUI() {
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addGuides(details: BenefitDetails) {
        // 이미 addGuides로 추가되어있는지 확인
        let guidView = self.vStackView.arrangedSubviews.filter { $0 is BenefitGuideView }
        guard guidView.isEmpty else { return }
        
        let guideViews: [BenefitGuideView] = details.guides.map { guide in
            let guideView = BenefitGuideView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
        guideViews.forEach { view in
            self.vStackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
}
