//
//  RingShape.swift
//  GeloouWatch Extension
//
//  Created by Arthur Bastos Fanck on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import SwiftUI

struct RingShape: Shape {
    var percent: Float
    
    var animatableData: Float {
        get { return percent }
        set { percent = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Angle(degrees: (Double(percent) / 100 * 360) - 90)
        let radius = width / 2
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: -90), endAngle: endAngle, clockwise: false)
        }
    }
}
