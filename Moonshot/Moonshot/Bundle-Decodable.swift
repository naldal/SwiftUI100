//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by 송하민 on 2/24/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url  = self.url(forResource: file, withExtension: nil) else { fatalError("failed to locate \(file) in bundle") }
        guard let data = try? Data(contentsOf: url) else { fatalError("fail to load \(file) from bundle.") }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else { fatalError("failed to decode \(file) from bundl") }
        return loaded
    }
}
