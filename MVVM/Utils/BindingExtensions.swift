//
//  BindingExtensions.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import RxCocoa
import RxSwift
import SwiftUI

infix operator <->
func <-> <E>(left: BehaviorRelay<E>, right: ControlProperty<E>) -> Disposable {
    right <-> left
}

infix operator <-
func <- <E>(left: BehaviorRelay<E>, right: ControlProperty<E>) -> Disposable {
    right.bind(to: left)
}

func <- <E, R: ObservableType>(left: BehaviorRelay<E>, right: R) -> Disposable
    where E == R.Element
{
    right.bind(to: left)
}

func <- <L: ObserverType, R: ObservableType>(left: L, right: R) -> Disposable
    where R.Element == L.Element
{
    right.bind(to: left)
}

func <- <L, R: ObservableType>(left: @escaping (L) -> (), right: R) -> Disposable
    where R.Element == L
{
    right.bind { value in
        left(value)
    }
}

func <- <L, R: ObservableType>(left: Binding<L>, right: R) -> Disposable
    where R.Element == L
{
    right.bind { value in
        left.wrappedValue = value
    }
}

func <- <E>(left: BehaviorRelay<Optional<E>>, right: ControlProperty<E>) -> Disposable {
    right.bind(to: left)
}

func <- <E, R: ObservableType>(left: BehaviorRelay<Optional<E>>, right: R) -> Disposable
    where E == R.Element
{
    right.bind(to: left)
}

func <- <L: ObserverType, R: ObservableType>(left: L, right: R) -> Disposable
    where L.Element == Optional<R.Element>
{
    right.bind(to: left)
}

func <- <L, R: ObservableType>(left: @escaping (L?) -> (), right: R) -> Disposable
    where R.Element == L
{
    right.bind { value in
        left(value)
    }
}

func <- <L, R: ObservableType>(left: Binding<Optional<L>>, right: R) -> Disposable
    where R.Element == L
{
    right.bind { value in
        left.wrappedValue = value
    }
}

//extension ObservableType where Element == Bool {
//    func invert() -> Bool {
//        map { !$0 }
//    }
//}
