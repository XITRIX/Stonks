//
//  UITableView+Registration.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit

extension UITableViewCell {
    static var id: String { "\(Self.self)" }
    static var nib: UINib { .init(nibName: id, bundle: Bundle(for: Self.self)) }
}

extension UITableView {
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.id)
    }

    func dequeue<T: UITableViewCell>(for indexPath: IndexPath? = nil) -> T {
        let cell: UITableViewCell?
        if let indexPath {
            cell = dequeueReusableCell(withIdentifier: T.id, for: indexPath)
        } else {
            cell = dequeueReusableCell(withIdentifier: T.id)
        }

        guard let result = cell as? T
        else { fatalError("Cell with id: \(T.id) is not registered") }

        return result
    }
}
