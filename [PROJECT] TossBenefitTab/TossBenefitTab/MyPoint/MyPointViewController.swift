//
//  MyPointViewController.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/18/24.
//

import UIKit

class MyPointViewController: UIViewController {
    
    var point: MyPoint = MyPoint.default

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
}
