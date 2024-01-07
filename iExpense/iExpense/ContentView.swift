//
//  ContentView.swift
//  iExpense
//
//  Created by 송하민 on 2/13/24.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.dismiss) var 닫아
    @Environment(\.colorScheme) var changeScheme
    
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            닫아()
        }
        .foregroundStyle(changeScheme == .dark ? .red : .blue)
    }
}

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            print(showingSheet)
            showingSheet.toggle()
            print(showingSheet)
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "@towstraws")
        })
    }
}

#Preview {
    ContentView()
}
