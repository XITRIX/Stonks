//
//  SceneDelegate.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

class SceneDelegate: MvvmSceneDelegate {
    override func register(in container: Container) {
        container.register(type: FinanceApiProtocol.self, factory: FinanceApi.init)
    }

    override func routing(in router: Router) {
        router.register(TestViewController<TestViewModel>.self)
        router.register(SecondViewController<SecondViewModel>.self)
        router.register(StocksViewController<StocksViewModel>.self)
        router.register(StockDetailsViewController<StockDetailsViewModel>.self)
    }

    override func resolveRootVC() -> UIViewController {
        let rootVM = StocksViewModel.self

        let nvc = UINavigationController(rootViewController: rootVM.resolveVC())
        nvc.navigationBar.prefersLargeTitles = true

        let splitView = SplitViewController(style: .doubleColumn )
        splitView.preferredDisplayMode = .oneBesideSecondary
        splitView.preferredSplitBehavior = .tile
        splitView.displayModeButtonVisibility = .never
        splitView.setViewController(nvc, for: .primary)
        return splitView
    }
}

class SplitViewController: UISplitViewController {
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        setViewController(nil, for: .secondary)
        super.showDetailViewController(vc, sender: sender)
    }
}
