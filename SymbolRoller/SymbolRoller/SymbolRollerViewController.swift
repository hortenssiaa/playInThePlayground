//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by Hakyung Sohn on 2022/05/21.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    // viewController : 페이지를 나타내기 위한 객제, 한 화면을 구성
    // viewController를 story board를 통해서 구성하는 경우는,
    // story board의 viewController와 code의 viewController를 연결해야하는데, 연결할때는 identity inspector -> Class에 해당 뷰컨트롤러의 이름을 넣어주면 됨
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        // life cycle 1
        // view에대한 내용이 메모리에 올라왔을때 호출
        super.viewDidLoad()
        
        // TO-DO
        // - 심볼에서, 하나를 임의로 추출해서
        // - 이미지와 텍스트를 설정한다.
        // DRY
        // Do not Repeat Yourself
        
        reload()
        button.tintColor =  UIColor.systemPink
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // life cycle 2
        // 스크린이 보이기 전에 호출이 됨
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // life cycle 3
        // 스크린이 다 보이고 나서는, viewDidApper이 호출됨
        super.viewDidAppear(animated)
    }
    
    func reload() {
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }

}
