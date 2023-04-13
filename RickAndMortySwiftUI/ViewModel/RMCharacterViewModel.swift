import Foundation
import Combine

class RMCharactersViewModel: ObservableObject {
    
    @Published var characters = [RMCharacter]()
    @Published var isData = true
    private var apiUrl = String()
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Tek Bir karakter gelince kullanılan Func
    func singleLoadData(characterUrl : String) {
        guard let url = URL(string: characterUrl ) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RMCharacter.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("burdayım")
                    print("Error: \(error)")
                case .finished:
                    print("Karakter verileri çekildi")
                }
            }, receiveValue: { [weak self] character in
                self?.characters = [character]
                return
            })
            .store(in: &cancellables)
    }
    //MARK: Birden fazla karakter geldiğinde kullanılan Func
    func multipleLoadData(characterUrl : String) {
        guard let url = URL(string: characterUrl ) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [RMCharacter].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("burdayım")
                    print("Error: \(error)")
                case .finished:
                    print("Karakter verileri çekildi")
                }
            }, receiveValue: { [weak self] characterA in
                self?.characters = characterA
                
            })
            .store(in: &cancellables)
    }
    //MARK: Karakter dizisindeki URL tek URL yapma
    func generationUrl(urls : [String]){
        let baseUrlString = "https://rickandmortyapi.com/api/"
        var idArray = [Int]()
        for url in urls{
            if let id = url.split(separator: "/").last.flatMap({ Int($0) }) {
                print("Karakter ID'si: \(id)")
                idArray.append(id)
            } else {
                print("Hatalı URL")
            }
        }
        let characterUrlString = baseUrlString + "character/" + idArray.map(String.init).joined(separator: ",")
        print(characterUrlString)
        apiUrl = characterUrlString
        if idArray.count > 1{
            isData = true
            multipleLoadData(characterUrl: apiUrl)
        }else if idArray.count == 1{
            isData = true
            print("Tek li Data")
            singleLoadData(characterUrl: apiUrl)
        }
        else{
            print("boş data")
            isData = false
        }
    }
}
