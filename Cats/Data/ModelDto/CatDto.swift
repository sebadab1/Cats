//
//  CatDto.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

struct CatDto: Codable {
    let breed: String
    let country: String
    let origin: String
    let coat: String
    let pattern: String
}
