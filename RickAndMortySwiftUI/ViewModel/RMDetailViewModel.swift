//
//  RMDetailViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 15.04.2023.
//

import Foundation
import Combine

protocol RMDetailViewModelInterface{
    func loadCharacteData(url: String)
    func generationUrl(urls : [String]) -> String
}


class RMDetailViewModel : ObservableObject{
    @Published var Character : RMCharacter?
    private var cancellables = Set<AnyCancellable>()
}

extension RMDetailViewModel : RMDetailViewModelInterface{
    func generationUrl(urls : [String]) -> String{
        var episodesArray = [String]()
        
        for url in urls{
            if let id = url.split(separator: "/").last.flatMap({ String($0) }) {
                print("Karakter ID'si: \(id)")
                episodesArray.append(id)
            } else {
                print("Hatalı URL")
            }
        }
        let episodes = episodesArray.map{ String($0) }.joined(separator: ", ")
        return episodes
    }
    
    func loadCharacteData(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RMCharacter.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Data loaded successfully.")
                }
            }, receiveValue: { [weak self] data in
                self?.Character = data
                print(self?.Character)
            })
            .store(in: &cancellables)
    }
    
}
