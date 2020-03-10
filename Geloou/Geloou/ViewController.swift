//
//  ViewController.swift
//  Geloou
//
//  Created by Anderson on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit
import WatchConnectivity

class Model: ObservableObject {
    static let shared = Model()
    
    @Published var currentTemperature: Float = 10
    @Published var targetTemperature: Float = 0
    @Published var percent: Float = 64
    @Published var timeLeft: Int = 2
    
    public func toDict() -> [String:Any] {
        return ["current":currentTemperature,
                "target":targetTemperature,
                "percent":percent,
                "timeLeft":timeLeft]
    }
    
}

class ViewController: UIViewController, WCSessionDelegate  {
    

    @IBOutlet weak var temperatureTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       assert(WCSession.isSupported(), "This sample requires Watch Connectivity support!")
       WCSession.default.delegate = self
       WCSession.default.activate()
    }

    @IBAction func sendToWatch(_ sender: Any) {
                
        let temp = temperatureTextField.text ?? "0"
        
        let message = Model.shared
        message.currentTemperature = Float(temp) ?? -10
        message.percent = 50
        message.targetTemperature = 2
        message.timeLeft = 5
        
            
//        WCSession.default.sendMessage(message.toDict(), replyHandler: { (replyMessage) in
//            print("replyMessage")
//            print(replyMessage)
//        }) { error in
//            print("Deu error")
//            print(error.localizedDescription)
//        }
        
        WCSession.default.transferCurrentComplicationUserInfo(message.toDict())
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    
}

