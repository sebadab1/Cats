//
//  CatImageCache.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

class CatImageCache {

    static var shared = CatImageCache()

    private init() { }

    private var dict = [String: String]()

    func addImage(_ image: String, for key: String) {
        dict[key] = image
    }

    func getImage(for key: String) -> String? {
        dict[key]
    }
}
