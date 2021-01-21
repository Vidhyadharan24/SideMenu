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
    
    public enum MenuItem {
        // SideMenu package will provide the menu item: Both the icon and opening/closing the side menu.
        case `default`

        // Client application should provide a view rendering an image that fits in the space for the menu button. SideMenu package takes care of opening/closing the side menu.
        case custom(AnyView)
        
        // SideMenu package will not provide a menu item-- it provides neither the icon or the opening/closing action. Client application must supply its own icon with `.navigationBarItems` modifer, and also must take care of opening/closing the side menu.
        case none
        
        var isNone: Bool {
            switch self {
            case .none:
                return true
            default:
                return false
            }
        }
        
        var isSome: Bool {
            return !isNone
        }
    }
    
    public var leftMenuItem: MenuItem
    public var rightMenuItem: MenuItem

    
    public init(menuBGColor: Color = .black, menuBGOpacity: Double = 0.3,
                menuWidth: CGFloat = 300, animationDuration: Double = 0.3, leftMenuItem: MenuItem = .default, rightMenuItem: MenuItem = .default) {
        self.menuBGColor = menuBGColor
        self.menuBGOpacity = menuBGOpacity
        self.menuWidth = menuWidth
        self.animationDuration = animationDuration
        self.leftMenuItem = leftMenuItem
        self.rightMenuItem = rightMenuItem
    }
}
