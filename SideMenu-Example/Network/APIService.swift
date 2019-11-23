//
//  APIService.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 13/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import Foundation
import Combine

protocol EndPoint {
    func urlRequest() -> URLRequest
}

class APIService<T> where T: Decodable {
    typealias APIPubliser = AnyPublisher<T, NetworkError>
    
    private var dataTask: URLSessionTask?
    private let backgroundQueue = DispatchQueue(label: "NetworkRequest.queue", qos: .background)
    
    deinit {
        self.dataTask?.cancel()
    }
    
    func fetchPhotosSignal(endPoint: EndPoint) -> APIPubliser {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared
            .dataTaskPublisher(for: endPoint.urlRequest()) // 1. Foundation's URLSession now has dataTask `Publisher`
            .map { $0.data } // 2. we retrieve `data` from the Publisher's `Output` tuple
            .mapError(NetworkError.mappedFromRawError) // 3. catch and map error that the dataTask `Publisher` emits
            .decode(type: T.self, decoder: decoder) // 4. Decode #3 data into array of `Photo` model
            .mapError({ (error) -> NetworkError in
                print("decoder error \(error)")
                return NetworkError.jsonDecoderError(error)
            }) // 5. catch and map error from JSONDecoder
            .subscribe(on: self.backgroundQueue) // process on background/private queue
            .receive(on: DispatchQueue.main) // send result on main queue
            .eraseToAnyPublisher() // IMPORTANT: use AnyPublisher to hide implementation details to outside, hence "type-erased"
    }
}
