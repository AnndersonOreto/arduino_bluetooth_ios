//
//  HostingController.swift
//  GeloouWatch Extension
//
//  Created by Arthur Bastos Fanck on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import WatchConnectivity

class HostingController: WKHostingController<RingView> {
    
    var wcSession: WCSession!
    var model = Model.shared
    
    override var body: RingView {
        return RingView(percent: model.percent, timeLeft: model.timeLeft)
    }
    
    override init() {
        super.init()
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
}

extension HostingController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        if let newMessage = message["temperatures"] as? [String: Float] {
            if let current = newMessage["current"],
                let target = newMessage["target"],
                let newPercent = newMessage["percent"],
                let newTime = newMessage["timeLeft"] {
                model.currentTemperature = current
                model.targetTemperature = target
                model.percent = newPercent
                model.timeLeft = Int(newTime)
            }
        }
        
        // Update Complication Timeline
        let server = CLKComplicationServer.sharedInstance()
        if let actives = server.activeComplications {
            actives.forEach{ server.reloadTimeline(for: $0) }
        }
    }
}
