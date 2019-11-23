//
//  ImageLoader.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class ImageLoader {

    typealias ImageLoadPublisher = AnyPublisher<UIImage?, NetworkError>
    
    fileprivate let backgroundQueue = DispatchQueue(label: "NetworkRequest.queue", qos: .background)

    public func loadImage(_ urlRequest: URLRequest) -> ImageLoadPublisher {
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError(NetworkError.mappedFromRawError)
            .map { UIImage(data: $0.data) }
            .mapError(NetworkError.mappedFromRawError)
            .subscribe(on: self.backgroundQueue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
