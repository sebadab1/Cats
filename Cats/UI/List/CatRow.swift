//
//  CatRow.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import SwiftUI

struct CatRow: View {
    let cat: Cat

    var body: some View {
        VStack {
            Image(cat.image)
                .resizable()
                .clipShape(.rect(cornerRadius: 16))
                .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fill)

            Spacer()
                .frame(height: 8)

            Text(cat.breed)
                .font(.system(size: 14, weight: .bold))
                .lineLimit(1)
                .foregroundStyle(Color.black)

            Spacer()
                .frame(height: 2)

            Text(cat.country.uppercased())
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(Color("SecondaryFontColor"))
                .lineLimit(1)
        }
    }
}

#Preview {
    CatRow(cat: .mock)
}
