//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 송하민 on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    
    var motto1: some View { 
        Text("인생을 즐겨라")
    }
    let motto2 = Text("느리지만 꾸준하게")
    
    @ViewBuilder var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
