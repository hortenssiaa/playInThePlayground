//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 2022/10/14.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {

    @IBOutlet weak var frameworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var learnMoreButton: UIButton!
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    var buttonTapped = PassthroughSubject<AppleFramework, Never>()
    var framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "Unknown"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        // input : Button 클릭
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) } // $0.urlString이 없으면 통과안함
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        // output : Data 세팅될때 UI update
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            self.frameworkImageView.image = UIImage(named: framework.imageName)
            self.titleLabel.text = framework.name
            self.descriptionLabel.text = framework.description
        }.store(in: &subscriptions)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
}

