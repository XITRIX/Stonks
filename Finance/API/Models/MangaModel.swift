//
//  MangaModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

struct MangaResponse<T: Codable>: Codable {
    var content: T
    var msg: String?
}

struct MangaModel: Codable, Hashable {
    var dir: String
    var enName: String?

    enum CodingKeys: String, CodingKey {
        case dir
        case enName = "en_name"
    }
}
