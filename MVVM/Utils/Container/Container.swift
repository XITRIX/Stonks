//
//  Container.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

public class Container {
    private var map = [String: HolderProtocol]()
}

// MARK: - Register
public extension Container {
    // MARK: - Multiresolved
    func register<T: Any>(type: T.Type, factory: @escaping () -> T) {
        map[String(describing: type)] = ResolverHolder(factory: factory)
    }

    func register<T: Any>(factory: @escaping () -> T) {
        map[String(describing: T.self)] = ResolverHolder(factory: factory)
    }

    // MARK: - Singleton
    func registerSingleton<T: Any>(type: T.Type, factory: @escaping () -> T) {
        map[String(describing: type)] = SingletonHolder(factory: factory)
    }

    func registerSingleton<T: Any>(factory: @escaping () -> T) {
        map[String(describing: T.self)] = SingletonHolder(factory: factory)
    }
}

// MARK: - Safe Resolve
public extension Container {
    func safeResolve<T: Any>(type: T.Type) -> T? {
        guard let obj = map[String(describing: type)]?.getter as? T
        else { return nil }

        return obj
    }

    func safeResolve<T: Any>() -> T? {
        guard let obj = map[String(describing: T.self)]?.getter as? T
        else { return nil }

        return obj
    }

    func safeResolve<T: Any>(id: String) -> T? {
        guard let obj = map[id]?.getter as? T
        else { return nil }

        return obj
    }
}

// MARK: - Resolve
public extension Container {
    func resolve<T: Any>(type: T.Type) -> T {
        guard let obj = safeResolve(type: type)
        else { fatalError("\(T.self) is not registered") }

        return obj
    }

    func resolve<T: Any>() -> T {
        guard let obj = safeResolve(type: T.self)
        else { fatalError("\(T.self) is not registered") }

        return obj
    }

    func resolve<T: Any>(id: String) -> T {
        guard let obj = map[id]?.getter as? T
        else { fatalError("\(T.self) is not registered") }

        return obj
    }
}
