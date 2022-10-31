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
    
    let network = NetworkService(configuration: .default)
    
    /*
     private(set) : 외부에서는 읽기만 가능(getter), 내부에서는 읽기/쓰기 모두 가능 (setter/getter) 간소화된 버전
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
        searchController.searchResultsUpdater = self // ** searchbar의 text detection
        searchController.searchBar.delegate = self // ** searchbar에서 search button 클릭시의 value detection
        self.navigationItem.searchController = searchController
    }
    
    // user update 될때마다 UI가 update 되게 >> user가 @Published 가 돼야한다.
    // data update
    private func bind() {
        $user
            .sink { [unowned self] result in
                self.updateUser(result)
            }.store(in: &subscription)
    }
    
    // data update detail
    private func updateUser(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.thumbnail.image = nil
            self.followerLabel.text = "n/a"
            self.followingLabel.text = "n/a"
            return
        }
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
        // image url (avatar_utl) -> img
        /*
         * Kingfisher : Kingfisher is a library for downloading and caching images from the web.
         * 使い方
            let url = URL(string: "https://example.com/image.png")
            imageView.kf.setImage(with: url)
         */
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
}

// searchResultsUpdater extension
extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

// searchBar.delegate extension
extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // network 요청 & 받기
        guard let keyword = searchBar.text, !keyword.isEmpty else { return } // 빈 문자열일 수 있으니
        
        // url - Resource
        /*    (previous version of Combine)
        let base = "https://api.github.com/" // 1. 스키마 & 도메인 주소
        let path = "users/\(keyword)" // 2.
        let params: [String: String] = [:] // 3. parameter (optional)
        let header: [String: String] = ["Content-Type": "application/json"] // 4.
        
        // making url 1. 기본 url components : base + path
        var urlComponents = URLComponents(string: base + path)!
        // making url 2. add parameter
        let queryItem = params.map { (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItem
        
        // making url 3. add header
        // url request에 필요한것 : url base + url path + url params + url header
        var request = URLRequest(url: urlComponents.url!) // http request시 header추가
        header.forEach { (key: String, value: String) in // header에 필요한 내용들 돌어가면서 넣기
            request.addValue(value, forHTTPHeaderField: key)
        }
         */
        let resource = Resource<UserProfile>( // UserProfile을 받기위한 Resource이기 때문에, <UserProfile>
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"])
        
        // URL Session - NetworkService
        /*
         * NetworkService.load(Recource에서 만든 url request용 url)
         - resource(== url) 넘겨주면, 필요한 뽑아주고
         - 뽑은 url request로, session에게 dataTask Publisher만들어줘!
         - 그리고, 데이터 및 에러 확인 까지 완료하고,
         - 데이터 받아서, 넘겨주는것까지 완료하는 메소드이다.
         */
        /*    (previous version of Combine)
         URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in // error check, result or (data: Data, response: URLResponse)
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1 // response가 nil일수도 있고, 그러면 -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: UserProfile.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error): // error인경우, user에 nil
                    self.user = nil
                case .finished: break
                }
                print("completion: \(completion)")
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscription)
         */
        network.load(resource) // 위 Resource에서 만든 url 넢는다.
            .receive(on: RunLoop.main) // scheduling
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscription)

        
    }
}
