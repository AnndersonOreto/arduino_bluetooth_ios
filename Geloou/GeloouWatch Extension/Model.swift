//
//  Model.swift
//  GeloouWatch Extension
//
//  Created by Arthur Bastos Fanck on 09/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import SwiftUI

class Model: ObservableObject {
    static let shared = Model()
    
    @Published var currentTemperature: Float = 10
    @Published var targetTemperature: Float = 0
    @Published var percent: Float = 64
    @Published var timeLeft: Int = 2
}
