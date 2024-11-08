//
//  bundleDecoder.swift
//  Moonshot
//
//  Created by RATSIMANOSIKA HERY on 27/10/2024.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        do{
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "y-MM-dd"
            decoder.dateDecodingStrategy = .formatted(formatter)
            let content = try decoder.decode(T.self, from: data)
            return content
        }catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        }catch DecodingError.typeMismatch( _ , let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        }catch DecodingError.dataCorrupted( _ ) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        }catch DecodingError.valueNotFound(let type , let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        }catch {
            fatalError("")
        }
    }
}
