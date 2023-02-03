//
//  MvvmViewModelProtocol.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxSwift
import RxRelay

public protocol MvvmViewModelProtocol: AnyObject {
    var title: BehaviorRelay<String?> { get }
    var navigationService: NavigationProtocol! { get set }
    init()

    func willAppear()
    func willDisappear()
}

public protocol MvvmViewModelWithProtocol: MvvmViewModelProtocol {
    associatedtype Model
    func prepare(with model: Model)
}

public class MvvmViewModel: MvvmViewModelProtocol {
    public let disposeBag = DisposeBag()
    public var title = BehaviorRelay<String?>(value: nil)
    public weak var navigationService: NavigationProtocol!
    public required init() {
        binding()
    }
    open func binding() {}

    open func willAppear() {}
    open func willDisappear() {}
}

public class MvvmViewModelWith<Model>: MvvmViewModel, MvvmViewModelWithProtocol {
    public func prepare(with model: Model) {}
}
