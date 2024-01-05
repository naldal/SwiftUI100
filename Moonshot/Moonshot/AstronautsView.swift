//
//  AstronautsView.swift
//  Moonshot
//
//  Created by 송하민 on 2/24/24.
//

import SwiftUI

struct AstronautsView: View {
    let astronaut: Astronaout
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
            }
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaout] = Bundle.main.decode("astronauts.json")
    return AstronautsView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
