//
//  GetPageUseCase.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import Combine

protocol GetPageUseCase {
    func callAsFunction(page: Int, limit: Int) -> AnyPublisher<Page, Error>
}

final class GetPageUseCaseImpl: GetPageUseCase {
    @Injected private var catsRepository: PageRepository

    func callAsFunction(page: Int, limit: Int) -> AnyPublisher<Page, Error> {
        catsRepository
            .getCats(page: page, limit: limit)
            .eraseToAnyPublisher()
    }
}
