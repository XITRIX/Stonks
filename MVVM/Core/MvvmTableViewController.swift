//
//  MvvmTableViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit
import RxSwift

public protocol MvvmTableViewControllerProtocol: UITableViewController, MvvmViewControllerProtocol { }

public class MvvmTableViewController<ViewModel: MvvmViewModelProtocol>: UITableViewController, MvvmTableViewControllerProtocol {
    public let disposeBag = DisposeBag()
    public let viewModel: ViewModel

    open override var nibName: String? {
        classNameWithoutGenericType
    }

    required public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.navigationService = self

        viewModel.title.bind(to: rx.title).disposed(by: disposeBag)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.willAppear()
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.willDisappear()
    }
}

internal extension MvvmTableViewController {
    var classNameWithoutGenericType: String {
        return "\(Self.self)".replacingOccurrences(of: "<\(ViewModel.self)>", with: "")
    }
}
