//
//  ViewController.swift
//  ZSTest
//
//  Created by Rajanikant shukla on 10/11/19.
//  Copyright © 2019 Rajanikant shukla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView:UITextView!
    @IBOutlet var actionButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "Pune, Mumbai, Bhopal"
    }

}

//Mark:- IBActions
extension ViewController {
    
    @IBAction func actionOnShowWeather(_ sender: Any){
        
        guard let text = textView.text else {
            return
        }
        
        let cities = text.components(separatedBy: ",")
        if cities.count > 0 {
            let config = DetailViewConfiguration.init(cities: cities)
            let detailVC = DetailViewController.buildController(configuration: config)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}

