//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by 송하민 on 2/12/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing, content: {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        })
    }
}

extension View {
    func watermark(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200)
            .watermark(with: "Hacking with Swift!")
    }
}


#Preview {
    ContentView()
}
