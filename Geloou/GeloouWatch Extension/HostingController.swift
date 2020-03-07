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

class HostingController: WKHostingController<RingView> {
    override var body: RingView {
        return RingView(percent: .constant(50))
    }
}
