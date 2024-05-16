//
//  GalleryView.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import SwiftUI

struct Gallery: View {
    let cats: [Cat]
    let defaultCat: Cat

    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(cats, id: \.self) { cat in
                            Image(cat.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.size.width, height: proxy.size.width)
                                .clipped()
                                .id(cat)
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .onAppear {
                    scrollProxy.scrollTo(defaultCat)
                }
            }
        }
        .ignoresSafeArea()
        .background(Color.black)
    }
}


#Preview {
    Gallery(cats: [.mock], defaultCat: .mock)
}
