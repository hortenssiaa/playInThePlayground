## 1. [PROJECT] Toss Benefit Tab (토스혜택 뷰 클론코딩)

### Used Class
- UICollectionViewDiffableDataSource
- UICollectionViewCompositionalLayout
- Section, Item, Snapshot 개념
  - 하나의 Item 안에 두가지 Model 보여주기 위한, [AnyHashable]
  
### Framework
- UIKit
- Combine


### 디자인 패턴
- MVVM 
![MVVM Diagram](https://github.com/user-attachments/assets/3fb56a3a-30c1-448e-ba49-06ab4a1a8e72)


<br>

- 요구사항
![요구사항 상세 분석](https://github.com/user-attachments/assets/f9426d5e-5e06-4fbb-9db6-fa0c7758e22e)




### 특이사항
1. VStack 에 동적 셀을 추가함
    - n초 후 동적으로 셀 추가 (아래 코드 확인)
      - @Published 프로퍼티로, DispatchQueue.main.asyncAfter(deadline: .now()+n 의 action에 데이터 주입
      - -> $benefitDetails 를 구독하고 있는 ButtonBenefitViewController애서 데이터 변경을 인식하여 업데이트 
2. 추가하는 셀은, 코드로 View 를 작성 
    - BenefitGuideView.swift 참고
3. 네트워크 딜레이 상황을 대비하였음 (아래 코드 확인)
    - @Published 프로퍼티로, DispatchQueue.main.asyncAfter(deadline: .now()+n 의 action에 데이터 주입

<br>


### 새로 배운 코드
- 특이사항 1) 네트워크 delay 상황 대비 (simulate network like behavior)

```swift
// ButtonBenefitViewModel.swift
...
@Published var benefitDetails: BenefitDetails?

func fetchDetails() {
  DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
  self.benefitDetails = .default
}
...


// ButtonBenefitViewController.swift

...
@IBOutlet weak var vStackView: UIStackView!

...
    private func bind() {
        viewModel.$benefitDetails
          .compactMap { $0 } // ButtonBenefitViewModel 의 benefitDetails 가 optional type 이기 때문에
          .receive(on: RunLoop.main)
          .sink { details in
            self.addGuides(details: details)
        }.store(in: &subscriptions)
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
...
```

<br>

- 특이사항 3) 네트워크 delay 되어, 뷰가 늦게 보여지는 상황 (simulate network like behavior)
```swift
// BenefitListViewModel.swift
@Published var todaySectionItems: [AnyHashable] = []
@Published var otherSectionItems: [AnyHashable] = []

func fetchItems() {
  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    self.todaySectionItems = TodaySectionItem(point: .default, benefit: .today).sectionItems
  }
   DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
     self.otherSectionItems = Benefit.others
   }
}
```

<br>

### 결과 화면
<img width="300" alt="tossbenefittap" src="https://github.com/user-attachments/assets/34cdf548-e9c1-4fc8-9df2-2b668e9a8cd9">








