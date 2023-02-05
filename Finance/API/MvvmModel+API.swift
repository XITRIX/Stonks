//
//  MvvmModel+API.swift
//  Finance
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import Foundation

extension MvvmViewModel {
    func apiCall<T>(fun: () async throws -> T) async -> T? {
        do {
            return try await fun()
        } catch {
            print(error)
            return nil
        }
    }
}
