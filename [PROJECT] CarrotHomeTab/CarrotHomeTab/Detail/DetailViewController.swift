//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/26/24.
//

import UIKit
import Kingfisher
import Combine

/// 예상해보는 당근마켓의 model 분리
// - itemInfo -> 서버, 올린 사람, 아이템 추가 정보, 등을 줘라
//.   : item의 모든 상세 정보가 아닌, 요약된 정보를 가질 것이다.
// - itemInfoDetails -> item에 대한 detail 정보
//.  이 예제 프로젝트에서는, api 가 준비돼있지 않으니 >> 서버를 타서 받아온 것 처럼 simulating 한다.
//       itemInfoDetails 새로 생성하기
//.         -> struct User, struct ItemInfo, struct ItemExtraInfo

class DetailViewController: UIViewController {

    // User
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userTemperature: UILabel!
    
    // Item
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPriceLable: UILabel!
    
    var viewModel: DetailViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        viewModel.fetch()
    }
    
    private func bind() {
        // viewModel 에서 fetch되어 아이템이 꽂히면, 보여줘야하니 >> 구독해야 알 수 있지
        viewModel.$itemDetails
            .compactMap { $0 } // nil 아닌 것만
            .receive(on: RunLoop.main)
            .sink { item in
                self.userNickName.text = item!.user.name
                self.userLocation.text = item!.user.location
                self.userTemperature.text = "\(item!.user.temperature)*C"
                self.userThumbnail.kf.setImage(
                    with: URL(string: (item!.user.thumbnail)),
                    placeholder: UIImage(named: "jubilee")
                )
                
                self.itemTitle.text = item!.item.title
                self.itemDescription.text = item!.details.description
                self.itemPriceLable.text = "\(item!.item.price)원"
                self.itemThumbnail.kf.setImage(
                    with: URL(string: (item!.details.itemThumbnail[0])),
                    placeholder: UIImage(named: "tv")
                )
            }.store(in: &subscriptions)
    }
    
    private func setupUI() {
        self.userThumbnail.layer.cornerRadius = self.userThumbnail.bounds.width / 2
        self.userThumbnail.layer.masksToBounds = true
    }
}
