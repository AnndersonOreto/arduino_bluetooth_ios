//
//  BluetoothConnectViewController.swift
//  Geloou
//
//  Created by Anderson on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class BluetoothConnectViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var circularProgressView: CircularProgressView!
    
    @IBOutlet weak var connectButton: UIButton!
    
    @IBAction func connectButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let bluetoothColor = UIColor(red: 24/255, green: 62/255, blue: 140/255, alpha: 1)
        
        circularProgressView = CircularProgressView(radius: containerView.frame.height / 2)
       
        circularProgressView.trackingBarColor = bluetoothColor.withAlphaComponent(0.1).cgColor
        circularProgressView.pulsingColor = bluetoothColor.withAlphaComponent(0.7).cgColor
        circularProgressView.centralAreaLayer.fillColor = bluetoothColor.cgColor
        circularProgressView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(circularProgressView)

        setCircularProgressConstraints()

        connectButton.backgroundColor = bluetoothColor
       
    }
    
    fileprivate func setCircularProgressConstraints() {
        circularProgressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        circularProgressView.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 1).isActive = true
        circularProgressView.widthAnchor.constraint(equalTo: containerView.widthAnchor,multiplier: 1).isActive = true
    } 
}
