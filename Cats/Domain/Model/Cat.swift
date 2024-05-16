//
//  Cat.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

struct Cat: Hashable {
    static let mock: Cat = Cat(breed: "MaineCoon", country: "Canada", image: "Cat1")

    let breed: String
    let country: String
    let image: String
}
