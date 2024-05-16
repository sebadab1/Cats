//
//  PageRepository.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import Combine

protocol PageRepository {
    func getCats(page: Int, limit: Int) -> AnyPublisher<Page, Error>
}
