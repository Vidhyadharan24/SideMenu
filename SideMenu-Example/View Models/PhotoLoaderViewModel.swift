//
//  PhotoListViewModel.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class PhotoLoaderViewModel: ObservableObject {
    typealias ViewModelSubject = PassthroughSubject<PhotoLoaderViewModel, Never>
    
    private lazy var imageLoader = ImageLoader()
    
    internal let willChange = ViewModelSubject()
    private var cancellables = [AnyCancellable]()
            
    var state: ViewState<UIImage> = .completedWithNoData {
        willSet {
            withAnimation {
                willChange.send(self)
            }
        }
    }
    
    
    deinit {
        cancel()
    }
    
    func fetchImage(urlString: String?) {
        guard let urlString = urlString else { return }
        
        guard let url = URL(string: urlString) else {
            cancel()
            return
        }
        
        cancel()
                
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        if let data = URLCache.shared.cachedResponse(for: urlRequest)?.data, let cachedImage = UIImage(data: data) {
            self.state = .completed(response: cachedImage)
            return
        }
        
        self.state = .loading
        
        let responsePublisher = self.imageLoader.loadImage(urlRequest)

        let responseStream = responsePublisher
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self?.state = .failed(error: error.message)
                }
            }, receiveValue: { [weak self] image in
                if let loadedImage = image {
                    self?.state = .completed(response: loadedImage)
                } else {
                    self?.state = .completedWithNoData
                }
            })
        
        // collect AnyCancellable subjects to discard later when `PhotoLoaderViewModel` life cycle ended
        self.cancellables += [responseStream]
    }
    
    func cancel() {
        _ = self.cancellables.map { $0.cancel() }
        self.cancellables.removeAll()
    }
    
}
