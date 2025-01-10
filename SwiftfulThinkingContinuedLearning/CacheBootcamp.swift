//
//  CacheBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager() // Singleton
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheVieModel: ObservableObject {
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "dragon"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got image from Cache"
        } else {
            infoMessage = "Image not found in Cache"
        }
        cachedImage = manager.get(name: imageName)
    }
}

struct CacheBootcamp: View {
    
    @StateObject var vm = CacheVieModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    if let image = vm.startingImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipped()
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    
                    Text(vm.infoMessage)
                        .font(.headline)
                        .foregroundStyle(.purple)
                    
                    HStack {
                        Button {
                            vm.saveToCache()
                        } label: {
                            Text("Save to Cache")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.blue)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        Button {
                            vm.removeFromCache()
                        } label: {
                            Text("Delete from Cache")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.red)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        Button {
                            vm.getFromCache()
                        } label: {
                            Text("Get from Cache")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.green)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                    
                    if let image = vm.cachedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipped()
                            .clipShape(.rect(cornerRadius: 10))
                    }

                    Spacer()
                }
                .navigationTitle("Cache Bootcamp")
            }
        }
    }
}

#Preview {
    CacheBootcamp()
}
