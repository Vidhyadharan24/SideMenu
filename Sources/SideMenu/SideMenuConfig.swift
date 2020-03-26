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
    
    public var menuWidth: CGFloat
    
    public var animationDuration: Double
    
    
    public init(menuBGColor: Color = .black, menuBGOpacity: Double = 0.3,
                menuWidth: CGFloat = 300, animationDuration: Double = 0.3) {
        self.menuBGColor = menuBGColor
        self.menuBGOpacity = menuBGOpacity
        self.menuWidth = menuWidth
        self.animationDuration = animationDuration
    }
}
