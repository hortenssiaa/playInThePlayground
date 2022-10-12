//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 2022/10/06.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let frameList: [AppleFramework] = AppleFramework.list
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    // diffable datasource쓰는데, collectionview는 보통 [section안에 [item, item]] item여러개 있는 타입인데,
    // 이 section, item에 대해 미리 어떤 타입인지 알려줄 수 있어? 가 >> <Section, Item>! 인 것이다!
    
    // typealias : 기존에 존재하는 data type에 새로운 이름붙이는 기능
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    // enum : 자체가 Hashable 하다
    // Item타입은, AppleFramework를 사용하려고 하지만,
    // 각각 다른 Item이 존재할때마다 다 다른 이름으로 계속 선언할 수 없으니, Typealias로 지정
    // Hashable : 구분가능한.. (Hashmap) 각각의 개체들을 구분자(hash)를 통해 구분할 수 있음
    
    /*
     [Section [Item]] [Section [Item]] [Section [Item]]
     >> 여러 Section과 그 안에 여러 Item이 있을 수 있고,
     >> 그래서 Section에 대한 구분 타입을 하나 만들어야 하고,
     >> Item에 대한 identifierType 에 대해 하나 만들어야 한다.
     
     diffable datasource을 계속 사용하려면, 계속 section, item type에 대해 정의를 해야함
     >> 사용되는 Item (data)는 계속 바뀌니, 그때마다 바꾸지 않도록
     >> 일관적이면 좋겠다!
     >> Typealias로 지정
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "☀️ Apple Frameworks"
        
        // presentation - diffable data source <- data source
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
//            let data = frameList[indexPath.item]
//            cell.configure(data)
            cell.configure(item)
            return cell
        })
        
        // data - snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main]) // .main은, 이미 타입으로 설정한 Section이 생략되어있기 때문에, 그 안의 main을 쓴 것
        snapshot.appendItems(frameList, toSection: .main) // 실제 data, Section이름
        dataSource.apply(snapshot)
        
        // layout - compositional layout <- flow layout
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        // fractionalWidth : 할당된 screen에서 * 0.33비율로 크기를 설정
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.41))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        // count : group에 표현되는 아이템 갯수
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
