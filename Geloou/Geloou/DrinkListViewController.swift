//
//  DrinkListViewController.swift
//  Geloou
//
//  Created by Annderson Packeiser Oreto on 06/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation
import UIKit

class DrinkListViewController: UIViewController {
    
    var circularProgressView: CircularProgressView!
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var drinkTypeLabel: UILabel!
    @IBOutlet weak var idealTemperatureLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Drink"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let bluetoothColor = UIColor(red: 24/255, green: 62/255, blue: 140/255, alpha: 0.0)
        
        // Set circular progress view appearence
        circularProgressView = CircularProgressView(radius: circularView.frame.height / 2)
        circularProgressView.trackingBarColor = bluetoothColor.withAlphaComponent(0.1).cgColor
        circularProgressView.pulsingColor = bluetoothColor.withAlphaComponent(0.0).cgColor
        circularProgressView.centralAreaLayer.fillColor = bluetoothColor.cgColor
        circularProgressView.alpha = 1
        circularProgressView.translatesAutoresizingMaskIntoConstraints = false
        circularProgressView.startProgressBarAnimation(seconds: 10)

        circularView.addSubview(circularProgressView)

        setCircularProgressConstraints()
    }
    
    @IBAction func confirmationAction(_ sender: UIButton) {
    }
    
    fileprivate func setCircularProgressConstraints() {
        circularProgressView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor).isActive = true
        circularProgressView.heightAnchor.constraint(equalTo: circularView.heightAnchor,multiplier: 1).isActive = true
        circularProgressView.widthAnchor.constraint(equalTo: circularView.widthAnchor,multiplier: 1).isActive = true
    }
}
