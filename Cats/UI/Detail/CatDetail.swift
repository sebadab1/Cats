//
//  CatDetail.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import SwiftUI

struct CatDetail: View {
    @Environment(\.dismiss) private var dismiss

    let cats: [Cat]
    let defaultCat: Cat

    var body: some View {
        Gallery(cats: cats, defaultCat: defaultCat)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image("Vector")
                    }
                }
            }
    }
}

#Preview {
    NavigationStack {
        CatDetail(cats: [.mock], defaultCat: .mock)
    }
}
