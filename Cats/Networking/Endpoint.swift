//
//  Endpoint.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

enum Endpoint {
    case breeds(page: Int, limit: Int)

    var path: String {
        switch self {
        case let .breeds(page, limit):
            "https://catfact.ninja/breeds?limit=\(limit)&page=\(page)"
        }
    }

    var method: HTTPMethod {
        return .get
    }
}
