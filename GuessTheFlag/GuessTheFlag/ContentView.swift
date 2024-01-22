//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 송하민 on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0, content: {
                Color.red
                Color.blue
            })
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
