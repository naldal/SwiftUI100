//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 송하민 on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
 
    var body: some View {
        Button("show alert") {
            showingAlert = true
        }
        .alert("Import message", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) {
                
            }
            Button("Delete", role: .destructive) {
                
            }
        } message: {
            Text("Please read this")
        }
    }
    
}

#Preview {
    ContentView()
}
