//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/25/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    // viewDidLoad 에서는, tab bar controller가 nil
    // viewWillAppear 시점에서는, tab bar's controller 가 nil 이 아니다
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
        case is HomeViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            let customItemView = CustomBarItem(config: titleConfig)
            let titleItem = UIBarButtonItem(customView: customItemView)
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass"),
                handler: { print(">>>> search tapped!!") }
            )
//            var searchItemView = CustomBarItem(config: searchConfig)
//            NSLayoutConstraint.activate([
//                searchItemView.widthAnchor.constraint(equalToConstant: 30)
//            ])
//            var searchItem = UIBarButtonItem(customView: searchItemView)
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print(">>>> feed tapped!!") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [searchItem, feedItem]
            
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print(">>>> feed tapped!!") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass"),
                handler: { print(">>>> search tapped!!") }
            )
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [searchItem]
            
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let settingConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape"),
                handler: {print(">>>>> gearshape tapped!!")}
            )
            let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
            
        default:
            let titleConfig = CustomBarItemConfiguration(
                title: "정자동",
                handler: {}
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateNavigationItem(vc: viewController)
    }
}
