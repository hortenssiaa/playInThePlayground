//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by Hakyung Sohn on 11/25/24.
//

import UIKit
import Combine

// 홈 뷰모델 만들기
// 뷰모델은 리스트를 가져오기
// bind 정의
// collectionView 지정

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = ItemInfo
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    let viewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConfigure()
        bind()
        viewModel.fetch()
    }
    
    private func collectionViewConfigure() {
        // presentation - cell
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemInfoCell", for: indexPath) as? ItemInfoCell else { return nil }
            cell.configure(items: item)
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([], toSection: .main)
        dataSource.apply(snapshot)
        
        // layout
        collectionView.collectionViewLayout = layout()
        
        collectionView.delegate = self
    }
    
    private func applyItems(item: [ItemInfo]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(item, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    private func bind() {
        // 1. viewModel 에서 fetch되어 아이템이 꽂히면, 보여줘야하니 >> 구독해야 알 수 있지
        viewModel.$itemInfo
            .receive(on: RunLoop.main)
            .sink { items in
                self.applyItems(item: items)
            }.store(in: &subscriptions)
        
        // 2. itemTapped passthroughsub ject로 >> why? send 로 아이템 주입 가능
        //   >> 주입시, 자동으로 인식 & sink 등으로 이벤트 실행
        viewModel.itemTapped
            .receive(on: RunLoop.main)
            .sink { ItemInfo in
                var sb = UIStoryboard(name: "Detail", bundle: nil)
                var vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = spacing
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemInfo = viewModel.itemInfo[indexPath.item]
        viewModel.itemTapped.send(itemInfo)
    }
}
