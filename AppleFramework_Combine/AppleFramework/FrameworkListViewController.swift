//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // Combine
    // 비동기처리에 유연하게 대응되게
    var subscriptions = Set<AnyCancellable>()
    var didSelect = PassthroughSubject<AppleFramework, Never>()
    //    방법2 - @Published보다, subject가 용이할때도 있음
    var items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)// 데이터를 첨만 갖고있다가, 나중에 변경될때
    //    방법1
    //    @Published var list: [AppleFramework] = AppleFramework.list
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionView 설정 - presentation, layout
        // collectionView data 설정
        configureCollectionView()
        bind()
    }
    
    private func bind() { // point logic
        // ** 이 어플에서 대응해야할 input, output 소스
        
        // 1. input : 사용자 input을 받아서 처리해야할 것
        // - item선택 되었을때 처리
        didSelect
            .receive(on: RunLoop.main) // Scheduler : UI update이니, 메인 스레드에서일어나게.
            .sink { [unowned self] framework in
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            vc.framework = framework
            // vc.modalPresentationStyle = .automatic
            self.present(vc, animated: true)
        }.store(in: &subscriptions) // subscription이 생겼으니, subscriptions통에 넣어준다.
        
        // 2. output: data / status 변경에따라, UI update할것
        // items가 새로 세팅되었을때 (서버에서 받아서 등 어떤형태로든 업데이트 됐을경우)
        // 방법1 - $list
        items // 방법2
            .receive(on: RunLoop.main) // main thread에서 작동해야하니, Scheduler 설정해주기
            .sink { [unowned self] list in
            self.applySectionItems(list)
        }.store(in: &subscriptions) // 또 만들어진 subscription -> subscriptions통으로 넣어놓기
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // layout
        collectionView.collectionViewLayout = layout()
        
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(1))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.42))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayout, count:   3)
        groupLayout.interItemSpacing = .fixed(spacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    // item이 selected됐을때 호출되는 메소드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 방법1
        // let framework = list[indexPath.item]
        // 방법2
        let framework = items.value[indexPath.item]
        print(">>> selected: \(framework.name)")
        
        // didSelect Publisher에 data 보내기
        didSelect.send(framework)
    }
}

