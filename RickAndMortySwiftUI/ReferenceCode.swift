//import Foundation
//
//let numbers = [1, 2, 3, 4, 5]
//let numberString = numbers.map { String($0) }.joined(separator: ", ")
//print(numberString) // "1, 2, 3, 4, 5"
//
//class Sinan {
//    var data: RickAndMortyModel?
//    var characters: [Chracter] = []
//
//    func readJson(url: URL, completion: @escaping (RickAndMortyModel?) -> ()) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//                    if let error = error {
//                        print(error.localizedDescription)
//                        completion(nil)
//                    } else if let data = data {
//                        let locationList = try? JSONDecoder().decode(RickAndMortyModel.self, from: data)
//                        if locationList != nil {
//                            completion(locationList)
//                        } else {
//                            completion(nil)
//                        }
//                    }
//                }
//                .resume()
//    }
//
//    // just  get character by url
//    func getCharacter(url: URL) -> Chracter? {
//        let character = try? JSONDecoder().decode(Chracter.self, from: try! Data(contentsOf: url))
//        return character
//    }
//}
//
////struct RickAndMortyModel: Codable {
////    let info: Info
////    let results: [Result]
////}
////
////struct Info: Codable {
////    let count, pages: Int
////    let next: String?
////    let prev: String?
////}
//
////struct Result: Codable {
////    let id: Int
////    let name, type, dimension: String
////    let residents: [String]
////    let url: String
////    let created: String
////}
//
////struct Chracter: Codable {
////    let id: Int
////    let name, status, species, type: String
////    let gender: String
////    let origin, location: Location
////    let image: String
////    let episode: [String]
////    let url: String
////    let created: String
////}
//
//
//struct Location: Codable {
//    let name: String
//    let url: String
//}
//
//// use this to get the data
//let url = URL(string: "https://rickandmortyapi.com/api/location")!
//
//let sinan = Sinan()
//// get data with group
//let group = DispatchGroup()
//group.enter()
//sinan.readJson(url: url) { data in
//    sinan.data = data
//    group.leave()
//}
//group.wait()
//
//
//print("getting characters")
//for result in sinan.data?.results ?? [] {
//    for resident in result.residents {
//        let tempUrl = URL(string: resident)!
//        let character = sinan.getCharacter(url: tempUrl)
//        sinan.characters.append(character!)
//    }
//}
//
//print("finished getting characters")
//// print all characters character
////for character in sinan.characters {
////    print(character)
////}
//
//// parse characters by locations
//var locations: [String: [Chracter]] = [:]
//for character in sinan.characters {
//    if locations[character.location.name] == nil {
//        locations[character.location.name] = [character]
//    } else {
//        locations[character.location.name]?.append(character)
//    }
//}
//
//// print locations and characters
//for (key, value) in locations {
//    print(key)
//    for character in value {
//        print(" ->\(character.name)")
//    }
//}
