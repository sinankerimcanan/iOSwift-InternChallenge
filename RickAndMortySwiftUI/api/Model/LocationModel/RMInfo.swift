//
//  RMInfo.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 9.04.2023.
//

import Foundation

struct RMInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
