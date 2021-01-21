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
    
    public enum MenuIcon {
        case `default`

        // Client application should provide a view rendering to an image that fits in the space for the menu button. SideMenu package takes care of opening/closing the side menu.
        case custom(AnyView)
        
        // SideMenu package will not use an icon; client application will supply own with `.navigationBarItems` modifer, and will also take care of opening the side menu/closing the side menu itself.
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
    
    public var leftMenuIcon: MenuIcon
    public var rightMenuIcon: MenuIcon

    
    public init(menuBGColor: Color = .black, menuBGOpacity: Double = 0.3,
                menuWidth: CGFloat = 300, animationDuration: Double = 0.3, leftMenuIcon: MenuIcon = .default, rightMenuIcon: MenuIcon = .default) {
        self.menuBGColor = menuBGColor
        self.menuBGOpacity = menuBGOpacity
        self.menuWidth = menuWidth
        self.animationDuration = animationDuration
        self.leftMenuIcon = leftMenuIcon
        self.rightMenuIcon = rightMenuIcon
    }
}
