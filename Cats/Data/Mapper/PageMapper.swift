//
//  PageMapper.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation

struct PageMapper {

    private let images = Array(1...15).map { "Cat\($0)"}

    func map(_ dto: PageDto) -> Page {
        Page(
            currentPage: dto.current_page,
            lastPage: dto.last_page,
            data: dto.data.map(mapCat)
        )
    }

    private func mapCat(_ dto: CatDto) -> Cat {
        Cat(
            breed: dto.breed,
            country: dto.country,
            image: getImageName(for: dto.breed)
        )
    }

    private func getImageName(for breed: String) -> String {
        if let imageName = CatImageCache.shared.getImage(for: breed) {
            return imageName
        } else{
            let randomImage = images.randomElement() ?? "Cat1"
            CatImageCache.shared.addImage(randomImage, for: breed)
            return randomImage
        }
    }
}
