//
//  ContentView.swift
//  WeSplit
//
//  Created by 송하민 on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["1", "2", "3", "1", "2", "3", "1", "2", "3", "1", "2", "3", "1", "2", "3"]
    @State private var selectedStudent = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    ContentView()
}
