//
//  NetworkError.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 03/07/19.
//  Copyright © 2019 Vid. All rights reserved.
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
