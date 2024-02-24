//
//  ContentView.swift
//  Moonshot
//
//  Created by 송하민 on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
