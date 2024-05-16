//
//  PageDto.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

struct PageDto: Codable {
    let current_page: Int
    let last_page: Int
    let data: [CatDto]
}
