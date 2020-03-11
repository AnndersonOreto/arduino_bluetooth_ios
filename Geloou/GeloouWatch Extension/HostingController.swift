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
        return RingView()
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
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        let current = userInfo["current"] as! Float
        let target = userInfo["target"] as! Float
        let newPercent = userInfo["percent"] as! Float
        let newTime = userInfo["timeLeft"] as! Int
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.model.currentTemperature = current
            self.model.targetTemperature = target
            self.model.percent = newPercent
            self.model.timeLeft = newTime
        }
        
        
        // Update Complication Timeline
        let server = CLKComplicationServer.sharedInstance()
        if let actives = server.activeComplications {
            actives.forEach{ server.reloadTimeline(for: $0) }
        }
    }
}
