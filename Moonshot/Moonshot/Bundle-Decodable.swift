//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by 송하민 on 2/24/24.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaout] {
        guard let url  = self.url(forResource: file, withExtension: nil) else { fatalError("failed to locate \(file) in bundle") }
        guard let data = try? Data(contentsOf: url) else { fatalError("fail to load \(file) from bundle.") }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([String: Astronaout].self, from: data) else { fatalError("failed to decode \(file) from bundl") }
        return loaded
    }
}
