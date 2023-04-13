//
//  RickAndMortyModel.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 7.04.2023.
// https://rickandmortyapi.com/api/location

import Foundation

struct RMLocation: Decodable {
    let info: RMInfo
    let results: [RMResults]?
}
