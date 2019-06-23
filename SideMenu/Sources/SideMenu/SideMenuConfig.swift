//
//  SideMenuConfig.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 21/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public struct SideMenuConfig {
    public var menuBGColor: Color
    public var menuBGOpacity: Double
    
    public var menuWidth: Length
    
    public var animationDuration: Double
    
    public var disableDragGesture: Bool
    
    public init(menuBGColor: Color = .red, menuBGOpacity: Double = 0.3,
                menuWidth: Length = 300, animationDuration: Double = 0.3,
                disableDragGesture: Bool = false) {
        self.menuBGColor = menuBGColor
        self.menuBGOpacity = menuBGOpacity
        self.menuWidth = menuWidth
        self.animationDuration = animationDuration
        self.disableDragGesture = disableDragGesture
    }
}
