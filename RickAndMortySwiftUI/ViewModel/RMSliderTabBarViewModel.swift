//
//  RMViewModel.swift
//  RickAndMortySwiftUI
//
//  Created by Sinan on 7.04.2023.
//

import Foundation
import Combine

protocol RMSliderTabBarViewModelInterface {
    func loadData()
}

class RMSliderTabBarViewModel: ObservableObject {
    @Published var Location : RMLocation?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadData()
    }
}

extension RMSliderTabBarViewModel : RMSliderTabBarViewModelInterface{
    //MARK: Page1 deki bütün location verilerini çeken Func
    func loadData() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RMLocation.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Data loaded successfully.")
                }
            }, receiveValue: { [weak self] data in
                self?.Location = data
            })
            .store(in: &cancellables)
    }
}
