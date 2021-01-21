//
//  BothMenus.swift
//  SideMenu
//
//  Created by Christopher G Prince on 1/20/21.
//  Copyright © 2021 Vid. All rights reserved.
//

import Foundation
import SwiftUI

struct MenuNavigation: View {
    let leftMenu: AnyView?
    let rightMenu: AnyView?
    @Binding var sideMenuCenterView: AnyView
    @Binding var sideMenuLeftPanel: Bool
    @Binding var sideMenuRightPanel: Bool
    let config: SideMenuConfig
    
    var body: some View {
        NavigationView {
            if (self.leftMenu != nil && self.rightMenu != nil) {
                BothMenus(sideMenuCenterView: $sideMenuCenterView, sideMenuLeftPanel: $sideMenuLeftPanel, sideMenuRightPanel: $sideMenuRightPanel, config: config)
            } else if (self.leftMenu != nil) {
                OnlyLeftMenu(sideMenuCenterView: $sideMenuCenterView, sideMenuLeftPanel: $sideMenuLeftPanel, config: config)
            } else if (self.rightMenu != nil) {
                OnlyRightMenu(sideMenuCenterView: $sideMenuCenterView, sideMenuRightPanel: $sideMenuRightPanel, config: config)
            }
        }
    }
}

struct BothMenus: View {
    @Binding var sideMenuCenterView: AnyView
    @Binding var sideMenuLeftPanel: Bool
    @Binding var sideMenuRightPanel: Bool
    let config: SideMenuConfig

    var body: some View {
        sideMenuCenterView
            .opacity(1)
            .transition(.opacity)
            .if(config.leftMenuItem.isSome && config.rightMenuItem.isSome) {
                $0.navigationBarItems(
                    leading:
                        LeftMenuButton(sideMenuLeftPanel: $sideMenuLeftPanel, config: config),
                    trailing:
                        RightMenuButton(sideMenuRightPanel: $sideMenuRightPanel, config: config)
                    )
            }
            .if(config.leftMenuItem.isSome && config.rightMenuItem.isNone) {
                $0.navigationBarItems(
                    leading:
                        LeftMenuButton(sideMenuLeftPanel: $sideMenuLeftPanel, config: config)
                    )
            }
            .if(config.leftMenuItem.isNone && config.rightMenuItem.isSome) {
                $0.navigationBarItems(
                    trailing:
                        RightMenuButton(sideMenuRightPanel: $sideMenuRightPanel, config: config)
                    )
            }
    }
}

struct OnlyLeftMenu: View {
    @Binding var sideMenuCenterView: AnyView
    @Binding var sideMenuLeftPanel: Bool
    let config: SideMenuConfig
    
    var body: some View {
        sideMenuCenterView
            .opacity(1)
            .transition(.opacity)
            .if(config.leftMenuItem.isSome) {
                $0.navigationBarItems(leading:
                    LeftMenuButton(sideMenuLeftPanel: $sideMenuLeftPanel, config: config)
                )
            }
    }
}

struct OnlyRightMenu: View {
    @Binding var sideMenuCenterView: AnyView
    @Binding var sideMenuRightPanel: Bool
    let config: SideMenuConfig
    
    var body: some View {
        sideMenuCenterView
            .opacity(1)
            .transition(.opacity)
            .if(config.rightMenuItem.isSome) {
                $0.navigationBarItems(trailing:
                    RightMenuButton(sideMenuRightPanel: $sideMenuRightPanel, config: config)
                )
            }
    }
}
