//
//  ContentView.swift
//  Moonshot
//
//  Created by 송하민 on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.armstrong)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
