//
//  CatList.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import SwiftUI

struct CatList: View {

    @StateObject var viewModel = CatListViewModel()

    private let flexibleColumn = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .onAppear(perform: viewModel.fetchMore)

        case .loaded(let cats):
            ScrollView {
                Spacer()

                Text("Cat breeds".uppercased())
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(Color("SecondaryFontColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)

                Spacer()
                
                LazyVGrid(columns: flexibleColumn, spacing: 16) {
                    ForEach(cats, id: \.self) { cat in
                        NavigationLink(value: cat) {
                            CatRow(cat: cat)
                        }
                    }

                    if viewModel.isMoreDataAvailable {
                        ProgressView()
                            .onAppear {
                                viewModel.fetchMore()
                            }
                    }
                }
                .padding(16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText, prompt: "What are you looking for?")
            .refreshable {
                viewModel.refresh()
            }
            .navigationDestination(for: Cat.self) { cat in
                CatDetail(cats: cats, defaultCat: cat)
            }

        case .error(let error):
            VStack {
                Text(error)

                Button {
                    viewModel.refresh()
                } label: {
                    Text("Refresh")
                }
            }
        }
    }
}

#Preview {
    CatList()
}
