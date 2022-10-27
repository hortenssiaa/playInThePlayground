//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    // UI setup
    // Model : UserProfile)
    // binding
    // search control
    // network
    
    /*
     private(set) : 외부에서는 읽기만 가능(getter), 내부에서는 읽기/쓰기 모두 가능 (setter/getter)
     - user 데이터가 update 될때마다 setting
     - network에서 갖고온 user가 nil 일수도 있어서 optional
     */
    @Published private(set) var user: UserProfile?
    var subscription = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = thumbnail.bounds.width / 2
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "hortenssiaa"
        searchController.searchResultsUpdater = self // searchbar의 text detection
        searchController.searchBar.delegate = self // searchbar에서 search button 클릭시의 value detection
        self.navigationItem.searchController = searchController
    }
    
    // user update 될때마다 UI가 update 되게 >> user가 @Published 가 돼야한다.
    private func bind() {
        $user
            .sink { [unowned self] result in
                self.updateUser(result)
            }.store(in: &subscription)
    }
    
    private func updateUser(_ user: UserProfile?) {
        
    }
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button clicked: \(searchBar.text)")
    }
}
