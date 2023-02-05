//
//  Router.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

public class Router {
    private var storage = [String: (Any?) -> any MvvmViewControllerProtocol]()
}

public extension Router {
    func register<VM: MvvmViewModelProtocol, VC: MvvmViewControllerProtocol>(_ controller: VC.Type)
        where VC.ViewModel == VM
    {
        storage[String(describing: VM.self)] = { _ in
            let vm = VM()
            return VC(viewModel: vm)
        }
    }

    func register<Model, VM: MvvmViewModelWithProtocol, VC: MvvmViewControllerProtocol>(_ controller: VC.Type)
        where VM.Model == Model, VC.ViewModel == VM
    {
        storage[String(describing: VM.self)] = { model in
            let vm = VM()
            vm.prepare(with: model as! Model)
            return VC(viewModel: vm)
        }
    }

    func safeResolve<VM: MvvmViewModelProtocol>(_ viewModel: VM.Type) -> (any MvvmViewControllerProtocol)? {
        storage[String(describing: VM.self)]?(nil)
    }

    func safeResolve<Model, VM: MvvmViewModelWithProtocol>(_ viewModel: VM.Type, with model: Model) -> (any MvvmViewControllerProtocol)?
        where VM.Model == Model
    {
        storage[String(describing: VM.self)]?(model)
    }

    func resolve<VM: MvvmViewModelProtocol>(_ viewModel: VM.Type) -> any MvvmViewControllerProtocol {
        guard let vc = safeResolve(viewModel)
        else { fatalError("Could not resolve \(VM.self). Register it first") }

        return vc
    }

    func resolve<Model, VM: MvvmViewModelWithProtocol>(_ viewModel: VM.Type, with model: Model) -> any MvvmViewControllerProtocol
        where VM.Model == Model
    {
        guard let vc = safeResolve(viewModel, with: model)
        else { fatalError("Could not resolve \(VM.self). Register it first") }

        return vc
    }
}
