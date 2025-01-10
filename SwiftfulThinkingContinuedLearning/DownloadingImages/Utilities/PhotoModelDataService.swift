//
//  PhotoModelDataService.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import Foundation
import Combine

class PhotoModelDataService {
    static let instance = PhotoModelDataService()
    
    @Published var photoModels: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        downloadData()
    }
    
    let photosUrl: String = "https://jsonplaceholder.typicode.com/photos"
    
    func downloadData() {
        guard let url = URL(string: photosUrl) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data: \(error)")
                }
            } receiveValue: { [weak self] returnedPhotoModels in
                self?.photoModels = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
