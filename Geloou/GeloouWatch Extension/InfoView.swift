//
//  InfoView.swift
//  GeloouWatch Extension
//
//  Created by Arthur Bastos Fanck on 06/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Temperatura atual")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .lineLimit(1)
                HStack {
                    Text("5")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.pink)
                    Text("ºC")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .padding([.bottom])
                }
            }
            VStack(alignment: .leading) {
                Text("Temperatura ideal")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .lineLimit(1)
                HStack {
                    Text("0")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                    Text("ºC")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .padding([.bottom])
                }
            }
        }.navigationBarTitle("Informações")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
