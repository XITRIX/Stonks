//
//  URL+Extensions.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(string: value)!
    }

    public func appending(_ path: String) -> URL {
        let path = self.absoluteString + "/" + path
        
        guard let url = URL(string: path)
        else { preconditionFailure("URL path: \(path) is incorrect") }

        return url
    }
}
