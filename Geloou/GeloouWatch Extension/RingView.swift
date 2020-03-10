//
//  ContentView.swift
//  GeloouWatch Extension
//
//  Created by Arthur Bastos Fanck on 05/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import SwiftUI

struct RingView: View {
    @State var percent: Float = Model.shared.percent
    @State var timeLeft: Int = Model.shared.timeLeft
    private let thickness: CGFloat = 25
    private let fontSize: CGFloat = 13
    private let gradientColors = [Color.blue, Color.white]
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .center) {
                RingShape(percent: 100)
                    .stroke(style: StrokeStyle(lineWidth: self.thickness - 2))
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: CGFloat(120), height: CGFloat(120), alignment: .center)
                RingShape(percent: self.percent)
                    .stroke(style: StrokeStyle(lineWidth: self.thickness, lineCap: .round))
                    .fill(LinearGradient(gradient: .init(colors: gradientColors), startPoint: .init(x: 0.5, y: 0.5), endPoint: .init(x: 1, y: 1)))
                    .frame(width: CGFloat(120), height: CGFloat(120), alignment: .center)
                Text(String(self.percent) + "%")
                    .font(.system(size: self.fontSize, weight: .bold, design: .rounded))
                    .offset(x: 9,y: -60)
                    .shadow(radius: 10)
                Text(self.timeLeft.description + "\nminutos")
                    .font(Font.system(size: fontSize+3, weight: .bold, design: .rounded))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }.frame(alignment: .center)
        }.frame(alignment: .center).navigationBarTitle("Tempo estimado")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percent: 80, timeLeft: 8)
    }
}
