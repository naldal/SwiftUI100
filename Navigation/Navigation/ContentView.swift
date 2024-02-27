//
//  ContentView.swift
//  Navigation
//
//  Created by 송하민 on 2/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text("hello")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
