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
    @IBOutlet weak var estimatedLabel: UILabel!
    @IBOutlet weak var estimatedTimeLabel: UILabel!
    var temperatureArray: [Double] = []
    
    // MARK: - arduino communicator
    private var communicator: ArduinoCommunicator!
    
    var is_cooling: Bool = false
//    private var loadingComponent: LoadingComponent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        is_cooling = UserDefaults.standard.bool(forKey: "gelou-state")
        
        self.title = "Drink"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    
    // MARK: - arduino communicator
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.loadingComponent = LoadingComponent()
        
        self.communicator = ArduinoCommunicator(delegate: self)
        
//        self.loadingComponent.addLoadingIndicator(to: self.view)
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
        if is_cooling {
            
        } else {
        circularProgressView.startProgressBarAnimation(seconds: 1)
        }

        circularView.addSubview(circularProgressView)

        setCircularProgressConstraints()
    }
    
    @IBAction func confirmationAction(_ sender: UIButton) {
        
        if is_cooling {
            UserDefaults.standard.set(false, forKey: "gelou-state")
        } else {
            
        }
    }
    
    public func updateState(temperature: String) {
        
        if is_cooling {
            confirmButton.setTitle("Retirei", for: .normal)
            degreesLabel.text = temperature
            drinkTypeLabel.text = "Cerveja lata"
            estimatedLabel.text = "estimado"
            estimatedTimeLabel.text = estimatedTime()
            idealTemperatureLabel.text = "ideal 5ºC"
        } else {
            degreesLabel.text = "bebida"
            confirmButton.setTitle("Gelar", for: .normal)
            drinkTypeLabel.text = "sem drink"
            estimatedLabel.text = "gele uma nova"
            estimatedTimeLabel.text = "-"
            idealTemperatureLabel.text = "sem temperatura ideal"
        }
    }
    
    func estimatedTime() -> String {
        
        if temperatureArray.count >= 5 {
            
            var resp: Double = 0.0
            let temperatureSize: Double = Double(temperatureArray.count)
            
            for i in 1..<temperatureArray.count {
                resp += (temperatureArray[i] - temperatureArray[i-1])
            }
            
            resp = resp / temperatureSize
            resp = resp / 10
            let temperature : Double = UserDefaults.standard.double(forKey: "gelou-temperature")
            resp = (temperatureArray[temperatureArray.count-1] - temperature) / resp
            
            return "\(resp)"
        }
        return ""
    }
    
    fileprivate func setCircularProgressConstraints() {
        circularProgressView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor).isActive = true
        circularProgressView.heightAnchor.constraint(equalTo: circularView.heightAnchor,multiplier: 1).isActive = true
        circularProgressView.widthAnchor.constraint(equalTo: circularView.widthAnchor,multiplier: 1).isActive = true
    }
}

//MARK: - A EXTENSION TA AQUI IRMAO
extension DrinkListViewController: ArduinoCommunicatorDelegate {
    func communicatorDidConnect(_ communicator: ArduinoCommunicator) {
//        self.loadingComponent.removeLoadingIndicators(from: self.view)
    }
    func communicator(_ communicator: ArduinoCommunicator, didRead data: Data) {
        //print("\n", String(data: data, encoding: .utf8)!)
        updateState(temperature: String(data: data, encoding: .utf8)!.split(separator: ".")[0] + "ºC")
        if temperatureArray.count < 5 {
            temperatureArray.append(Double(String(data: data, encoding: .utf8) ?? "0.0") ?? 0.0)
        }
    }
    func communicator(_ communicator: ArduinoCommunicator, didWrite data: Data) {
        print(#function)
        print(String(data: data, encoding: .utf8)!)
    }
}

