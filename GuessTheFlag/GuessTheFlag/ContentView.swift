//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 송하민 on 2/11/24.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        Button {
            print("button was tapped")
        } label: {
            HStack {
                Label("edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
