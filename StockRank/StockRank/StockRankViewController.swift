//
//  StockRankViewController.swift
//  StockRank
//
//  Created by Hakyung Sohn on 2022/06/05.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    
    // UI Collection View 를 통해서, list를 표현할때,
    // UICollectoinView에게 아래 세가지를 알려줘야한다.
    // Data, Presentation, Layout
    // Data - 어떤 데이터를 쓸꺼야? -> stockList
    // Presentation - 셀을 어떻게 표현할거야?
    // Layout - 셀들을 어땋게 배치할거야?
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data, presentation
        collectionView.dataSource = self
        
        // layout - 배치, 셀 사이즈
        collectionView.delegate = self
    }
    
    // 알려주는 대상은 누구인지 (self : UICollectionView)인 것을 알려줬으니,
    // 이제는, 실제로 알려주는 행위를 해야함
    // extension UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
}

extension StockRankViewController: UICollectionViewDataSource {
    
    // CollectionView에서는, 여러개의 section으로 나눠서 셀을 표현할 수 있는데, 한 section에 14개의 item을 표현할 예정
    // CollectionView에 data 몇개 들어 올지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // CollectionView에서, 셀을 어떻게 표현할것인지 에 대한 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        // stockList는 배열이니깐, 몇번째 갖고올지는, indexPath로 index 갖고온다.
        // indexPath : section, section에 들어가는 row정보가 들어있다.
        // indexPath.item : item정보가 collectionView의 section안에 있는 아이템이, 몇번째에 있는지
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    // UICollectionViewDelegateFlowLayout : UICollectionView에서, 셀들을 어떻게 배치할것인지에 대한 프로토콜
    // width = collectionView
    // height = 80
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
