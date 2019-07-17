//
//  Splash.swift
//  CombineUnsplash
//
//  Created by Vinh Nguyen on 8/6/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case mappedFromRawError(Error)
    case jsonDecoderError(Error)
}

extension NetworkError {
    var message: String {
        switch self {
        case .mappedFromRawError(let error), .jsonDecoderError(let error):
            return error.localizedDescription
        }
    }
}

extension NetworkError: LocalizedError {
    var localizedDescription: String {
        return "[ERROR] \(self.message)"
    }
}
