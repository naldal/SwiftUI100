//
//  ContentView.swift
//  Navigation
//
//  Created by 송하민 on 2/25/24.
//

import SwiftUI

class PathScore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save() {
        guard let representaion = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representaion)
            try data.write(to: savePath)

        } catch {
            print("failed to save navigation data ")
        }
    }
}

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
