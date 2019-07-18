//
//  PhotoListViewModel.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class PhotoLoaderViewModel: BindableObject {
    typealias ViewModelSubject = PassthroughSubject<PhotoLoaderViewModel, Never>
    typealias ResponseSubject = PassthroughSubject<UIImage?, NetworkError>

    private lazy var imageLoader = ImageLoader()

    internal let didChange = ViewModelSubject()
    private let responseSubject = ResponseSubject()
    private let errorSubject = ResponseSubject()
    private var cancellables = [AnyCancellable]()
    
    let imageCache = NSCache<NSString, UIImage>()
    
    var imageUrlString: String? = nil
    
    var state: ViewState<UIImage> = .completedWithNoData {
        didSet {
            withAnimation {
                didChange.send(self)
            }
        }
    }
    
    init(urlString: String?) {
        fetchImage(urlString: self.imageUrlString)
    }
    
    deinit {
        cancel()
    }
    
    func fetchImage(urlString: String?) {
        guard let urlString = urlString,
            (imageUrlString == nil || imageUrlString! != urlString)  else {
            return
        }
        
        guard let url = URL(string: urlString) else {
            cancel()
            return
        }
        
        cancel()
        
        imageUrlString = urlString

        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        if let data = URLCache.shared.cachedResponse(for: urlRequest)?.data, let cachedImage = UIImage(data: data) {
            self.state = .completed(response: cachedImage)
            return
        }
        
        self.state = .loading
        
        let responsePublisher = self.imageLoader.loadImage(urlRequest)
        

        // map responseStream into AnyCancellable
        let responseStream = responsePublisher
            .share() // return as class instance (this is later to cancel on AnyCancellable)
            .subscribe(self.responseSubject) // attach to an `responseSubject` subscriber
        
        // map errorStream into AnyCancellable
        let errorStream = responsePublisher
            .catch { [weak self] error -> Publishers.Empty<UIImage?, NetworkError> in // catch `self.networkRequest.fetchListSignal()` event error
                self?.state = .failed(error: error.message)
                return Publishers.Empty()
        }
        .share()
        .subscribe(self.errorSubject)
        
        // attach `responseSubject` with closure handler, here we process `models` setter
        _ = self.responseSubject
            .sink { [weak self] image in
                if let loadedImage = image {
                    self?.state = .completed(response: loadedImage)
                } else {
                    self?.state = .completedWithNoData
                }
        }
        
        // collect AnyCancellable subjects to discard later when `SplashViewModel` life cycle ended
        self.cancellables += [responseStream, errorStream]
    }
    
    func cancel() {
        _ = self.cancellables.map { $0.cancel() }
        self.cancellables.removeAll()
    }
    
}
