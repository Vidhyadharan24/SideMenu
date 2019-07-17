//
//  Date.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import UIKit

extension ISO8601DateFormatter {
    
//    2019-05-01T16:22:03-04:00
    
    static let iso8601Full: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withFullTime, .withTimeZone, .withFractionalSeconds]
        return formatter
    }()
    
}
