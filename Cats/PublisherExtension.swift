//
//  PublisherExtension.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import Combine

extension Publisher {
    func materialize() -> AnyPublisher<Result<Output, Failure>, Never> {
        return map(Result.success)
            .catch { Just(.failure($0)) }
            .eraseToAnyPublisher()
    }
}
