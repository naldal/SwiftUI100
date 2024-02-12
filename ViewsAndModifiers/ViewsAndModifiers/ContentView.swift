//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 송하민 on 2/12/24.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let colums: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<colums, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        GridStack(rows: 4, colums: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}


#Preview {
    ContentView()
}
