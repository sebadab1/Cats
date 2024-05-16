//
//  PageRepositoryImpl.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import Combine

final class PageRepositoryImpl: PageRepository {
    @Injected private var apiClient: APIClient

    func getCats(page: Int, limit: Int) -> AnyPublisher<Page, any Error> {
        apiClient
            .makeRequest(.breeds(page: page, limit: limit))
            .map { dto in
                return PageMapper().map(dto)
            }
            .eraseToAnyPublisher()
    }
}
