//
//  TemperatureViewViewController.swift
//  Geloou
//
//  Created by Marcus Vinicius Vieira Badiale on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureSlider: UISlider!
    @IBOutlet weak var imageTemperature: UIImageView!
    
    
    @IBOutlet weak var gelarButton: UIButton!
    @IBAction func gelarActionButton(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "gelou-state") // salva estado
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var testLayer = CAShapeLayer()
    var drinkSelected: (String, String) = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Rotate the slider vertically
        temperatureSlider.transform = CGAffineTransform(rotationAngle: CGFloat( -Double.pi/2 ))
        temperatureLabel.text = String(Int(temperatureSlider.value)) + "ºC"
    }
    
    @IBAction func slider(_ sender: UISlider) {
        //Change label according slider value
        temperatureLabel.text = String( Int(temperatureSlider.value)) + "ºC"
        
        //Change label and slider colors according temperature
        if temperatureSlider.value >= 12 {
            temperatureLabel.textColor = .systemOrange
            temperatureSlider.thumbTintColor = .systemOrange
        } else if temperatureSlider.value >= 7 {
            temperatureLabel.textColor = .systemYellow
            temperatureSlider.thumbTintColor = .systemYellow
        } else {
            temperatureLabel.textColor = .systemTeal
            temperatureSlider.thumbTintColor = .systemTeal
        }
    }
    
    //----------------------------
    //Save temperature value here:
    //----------------------------
    
    //For this use slider.value
}
