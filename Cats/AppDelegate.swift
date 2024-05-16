//
//  AppDelegate.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        register()
        return true
    }

    private func register() {
        DependencyContainer.shared.register(APIClient.self, APIClient.init)
        DependencyContainer.shared.register(PageMapper.self, PageMapper.init)
        DependencyContainer.shared.register(PageRepository.self, PageRepositoryImpl.init)
        DependencyContainer.shared.register(GetPageUseCase.self, GetPageUseCaseImpl.init)
    }
}
