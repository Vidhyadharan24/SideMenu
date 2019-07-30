//
//  HomeViewModel.swift
//  SideMenu-Example
//
//  Created by Vid on 12/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class PhotosViewModel: ObservableObject {
    typealias ViewModelSubject = PassthroughSubject<PhotosViewModel, Never>
    
    // MARK: - Properties
    
    private lazy var apiService = APIService<[Photo]>()
    
    // MARK: - Binding
    
    internal let willChange = ViewModelSubject()
    private var cancellables = [AnyCancellable]()
    
    var state: ViewState<[Photo]> = .completedWithNoData {
        willSet {
            willChange.send(self)
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

        let responseStream = responsePublisher
          .sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                self?.state = .failed(error: error.message)
            }
            }, receiveValue: { [weak self] photos in
                if photos.count > 0 {
                    self?.state = .completed(response: photos)
                } else {
                    self?.state = .completedWithNoData
                }
        })
        
        // collect AnyCancellable subjects to discard later when `PhotosViewModel` life cycle ended
        self.cancellables += [responseStream]
    }
    
}
