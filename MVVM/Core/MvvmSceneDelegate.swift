//
//  MvvmSceneDelegate.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

public class MvvmSceneDelegate: UIResponder, UIWindowSceneDelegate {
    public var window: UIWindow?

    open func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        register(in: Mvvm.shared.container)
        routing(in: Mvvm.shared.router)

        window.rootViewController = resolveRootVC()
        window.makeKeyAndVisible()
    }

    open func register(in container: Container) {}

    open func routing(in router: Router) {}

    open func resolveRootVC() -> UIViewController {
        fatalError("resolveRootVC() has not been implemented")
    }
}
