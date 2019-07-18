//
//  HomeViewModel.swift
//  SideMenu-Example
//
//  Created by Vid on 12/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class PhotosViewModel: BindableObject {
    typealias ViewModelSubject = PassthroughSubject<PhotosViewModel, Never>
    typealias ResponseSubject = PassthroughSubject<[Photo], NetworkError>
    
    // MARK: - Properties
    
    private lazy var apiService = APIService<[Photo]>()
    
    // MARK: - Binding
    
    internal let didChange = ViewModelSubject()
    private let responseSubject = ResponseSubject()
    private let errorSubject = ResponseSubject()
    private var cancellables = [AnyCancellable]()
    
    var state: ViewState<[Photo]> = .completedWithNoData {
        didSet {
            didChange.send(self)
        }
    }
    
    deinit {
        _ = self.cancellables.map { $0.cancel() }
        self.cancellables.removeAll()
    }
    
    // MARK: - Public
    
    func fetchPhotos(orderBy: PhotosEndPoint.OrderBy) {
        self.state = .loading
        
        let photosEndPoint = PhotosEndPoint.photos(orderBy: orderBy)
        let responsePublisher = self.apiService.fetchPhotosSignal(endPoint: photosEndPoint)
        
        // map responseStream into AnyCancellable
        let responseStream = responsePublisher
            .share() // return as class instance (this is later to cancel on AnyCancellable)
            .subscribe(self.responseSubject) // attach to an `responseSubject` subscriber
        
        // map errorStream into AnyCancellable
        let errorStream = responsePublisher.catch { [weak self] error -> Publishers.Empty<[Photo], NetworkError> in // catch `self.networkRequest.fetchListSignal()` event error
            self?.state = .failed(error: error.message)
            return Publishers.Empty()
        }.share() // return this publisher as class instance (this is later to cancel on AnyCancellable)
        .subscribe(self.errorSubject) // attach to `errorSubject` subscriber
        
        // attach `responseSubject` with closure handler, here we process `models` setter
        _ = self.responseSubject
            .sink { [weak self] photos in
                if photos.count > 0 {
                    self?.state = .completed(response: photos)
                } else {
                    self?.state = .completedWithNoData
                }
        }
        
        // collect AnyCancellable subjects to discard later when `SplashViewModel` life cycle ended
        self.cancellables += [
            responseStream,
            errorStream
        ]
    }
    
}
