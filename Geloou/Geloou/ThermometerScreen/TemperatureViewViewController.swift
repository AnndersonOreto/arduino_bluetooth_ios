//
//  TemperatureViewViewController.swift
//  Geloou
//
//  Created by Marcus Vinicius Vieira Badiale on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testSlider: UISlider!
    @IBOutlet weak var imageTemperature: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testSlider.transform = CGAffineTransform(rotationAngle: CGFloat( -Double.pi/2 ))
        testLabel.text = String(Int(testSlider.value)) + "ºC"
    }
    
    @IBAction func slider(_ sender: UISlider) {
        testLabel.text = String( Int(testSlider.value)) + "ºC"
        
        if testSlider.value >= 12 {
            testLabel.textColor = .systemOrange
        } else if testSlider.value >= 7 {
            testLabel.textColor = .systemYellow
        } else {
            testLabel.textColor = .systemTeal
        }
    }
}
