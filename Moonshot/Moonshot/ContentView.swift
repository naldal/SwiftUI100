//
//  ContentView.swift
//  Moonshot
//
//  Created by 송하민 on 2/21/24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView (.horizontal){
            LazyHStack(spacing: 10, content: {
                ForEach(0..<100) {
                    CustomText(text: "item \($0)")
                        .font(.title)
                }
            })
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
