//
//  RMLocation.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 7.04.2023.
//

import Foundation

struct RMResults : Decodable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
