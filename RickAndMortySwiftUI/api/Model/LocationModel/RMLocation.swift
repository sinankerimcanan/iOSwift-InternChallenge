// https://rickandmortyapi.com/api/location

import Foundation

struct RMLocation: Decodable {
    let info: RMInfo
    let results: [RMResults]?
}
