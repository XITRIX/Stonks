//
//  ApiError.swift
//  Finance
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import Foundation

struct ApiError: Error {
    let message: String
    var localizedDescription: String { message }
}
