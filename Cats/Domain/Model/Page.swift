//
//  Page.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

struct Page {
    let currentPage: Int
    let lastPage: Int
    let data: [Cat]

    init(currentPage: Int, lastPage: Int, data: [Cat]) {
        self.currentPage = currentPage
        self.lastPage = lastPage
        self.data = data
    }
}
