//
//  EntityType.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

public protocol EntityType: Codable {
    func encodeObject() throws -> String
    static func decodeObject<T: Decodable>(withData data: Data) throws -> T
}

public extension EntityType {
    
    func encodeObject() throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(self), let printableValue = String(data: data, encoding: .utf8) else { throw NSError.createError(withMessage: "error") }
        return printableValue
    }
    
    static func decodeObject<T: Decodable>(withData data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
