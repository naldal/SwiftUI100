//
//  ContentView.swift
//  Moonshot
//
//  Created by 송하민 on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row )")
                }
            }
            .navigationTitle("swiftui")
        }
    }
}

#Preview {
    ContentView()
}
