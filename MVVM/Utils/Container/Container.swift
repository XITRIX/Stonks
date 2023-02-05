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
        register(type: T.self, factory: factory)
    }

    // MARK: - Singleton
    func registerSingleton<T: Any>(type: T.Type, factory: @escaping () -> T) {
        map[String(describing: type)] = SingletonHolder(factory: factory)
    }

    func registerSingleton<T: Any>(factory: @escaping () -> T) {
        registerSingleton(type: T.self, factory: factory)
    }
}

// MARK: - Safe Resolve
public extension Container {
    func safeResolve<T: Any>(type: T.Type) -> T? {
        guard let obj = safeResolve(id: String(describing: type)) as T?
        else { return nil }

        return obj
    }

    func safeResolve<T: Any>() -> T? {
        guard let obj = safeResolve(type: T.self)
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
        resolve(id: String(describing: type)) as T
    }

    func resolve<T: Any>() -> T {
        resolve(type: T.self)
    }

    func resolve<T: Any>(id: String) -> T {
        guard let obj = safeResolve(id: id) as T?
        else { fatalError("\(T.self) is not registered") }

        return obj
    }
}
