//
//  CatListViewModel.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import SwiftUI
import Combine

enum LoadingViewState<Result> {
    case loading
    case loaded(Result)
    case error(String)

    var isLoaded: Bool {
        switch self {
        case .loaded:
            return true
        default:
            return false
        }
    }
}

class CatListViewModel: ObservableObject {
    @Injected var getCatsUseCase: GetPageUseCase

    @Published var searchText = ""
    @Published var isMoreDataAvailable: Bool = true
    @Published private(set) var state: LoadingViewState<[Cat]> = .loading

    private var cats: [Cat] = []
    private var currentPage: Int = 0
    private var cancellables = Set<AnyCancellable>()


    init() {
        observeSearchText()
    }

    func fetchMore() {
        currentPage += 1
        
        getCatsUseCase(page: currentPage, limit: 24)
            .materialize()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self else {
                    return
                }

                switch result {
                case .success(let page):
                    isMoreDataAvailable = page.lastPage > currentPage
                    
                    self.cats.append(contentsOf: page.data)
                    state = .loaded(self.cats)
                case .failure(let failure):
                    state = .error(failure.localizedDescription)
                }
            }
            .store(in: &cancellables)
    }

    func refresh() {
        cats = []
        currentPage = 0
        isMoreDataAvailable = true

        fetchMore()
    }

    private func observeSearchText() {
        $searchText
            .sink { [weak self] text in
                guard let self else {
                    return
                }

                guard state.isLoaded else {
                    return
                }

                if text.isEmpty {
                    state = .loaded(cats)
                } else {
                    let results = cats.filter { $0.breed.contains(text) || $0.country.contains(text) }
                    state = .loaded(results)
                }
            }
            .store(in: &cancellables)
    }
}
