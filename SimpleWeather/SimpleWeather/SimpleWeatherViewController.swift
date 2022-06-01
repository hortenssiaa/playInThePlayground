//
//  SimpleWeatherViewController.swift
//  SimpleWeather
//
//  Created by Hakyung Sohn on 2022/05/23.
//

import UIKit

class SimpleWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tempurtureLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    let cities : [String] = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers : [String] = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        cityLable.text = cities.randomElement()
        
        let imageText = weathers.randomElement()!
        weatherImageView.image = UIImage(systemName: imageText)?.withRenderingMode(.alwaysOriginal) // rendering type : multicolor
        //weatherImageView.image = UIImage(systemName: imageText)?.withRenderingMode(.alwaysTemplate) // image color rendered by setted tint color
        
        let tempurtureText = Int.random(in: 10..<30)
        tempurtureLable.text = "\(tempurtureText)°"
    }
    
}
