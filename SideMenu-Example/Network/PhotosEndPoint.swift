//
//  APIService+Photos.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 13/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import UIKit

enum PhotosEndPoint: EndPoint {
    
    private static let path = "/photos"

    enum OrderBy: String {
        case latest
        case oldest
        case popular
    }
    
    case photos(page: Int = 1, perPage: Int = 50, orderBy: OrderBy)

    func urlRequest() -> URLRequest {
        switch self {
        case let .photos(page, perPage, orderBy):
            return photosListURLRequest(page: page, perPage: perPage, orderBy: orderBy)
        }
    }

}

extension PhotosEndPoint {
    
    func photosListURLRequest(page: Int, perPage: Int, orderBy: OrderBy) -> URLRequest {
        let urlQueryItems = [
            URLQueryItem(name: "client_id", value: Constants.API.apiKey),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "per_page", value: String(perPage)),
            URLQueryItem(name: "order_by", value: orderBy.rawValue)
        ]
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.API.baseUrl
        components.path = PhotosEndPoint.path
        components.queryItems = urlQueryItems
        let url = components.url!
        
        var urlRequest = URLRequest(url:url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("v1", forHTTPHeaderField: "Accept-Version")

        return urlRequest
    }
    
}
