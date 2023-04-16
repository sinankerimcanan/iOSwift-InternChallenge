import Foundation

struct RMInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
