//
//  GeometryProxyExtension.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 20/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

extension GeometryProxy {
    
    var actualScreenSize: CGSize {
        CGSize(width: size.width + safeAreaInsets.leading + safeAreaInsets.trailing,
               height: size.height + safeAreaInsets.top + safeAreaInsets.bottom)
    }
    
}
