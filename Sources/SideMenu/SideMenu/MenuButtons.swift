//
//  MenuButtons.swift
//  
//
//  Created by Christopher G Prince on 1/20/21.
//

import Foundation
import SwiftUI

struct MenuIcon: View {
    let icon: SideMenuConfig.MenuItem
    let defaultAccentColor: Color
    let defaultImageName: String
    
    var body: some View {
        if case .default = icon {
            Image(systemName: defaultImageName)
                .accentColor(defaultAccentColor)
                .imageScale(.large)
        }
        else if case .custom(let view) = icon {
            view
        }
        else if case .none = icon {
            // Should not get here.
            EmptyView()
        }
    }
}

struct LeftMenuButton: View {
    @Binding var sideMenuLeftPanel: Bool
    let config: SideMenuConfig
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.sideMenuLeftPanel.toggle()
            }
        }, label: {
            MenuIcon(icon: config.leftMenuItem, defaultAccentColor: .blue, defaultImageName: "sidebar.left")
        })
    }
}

struct RightMenuButton: View {
    @Binding var sideMenuRightPanel: Bool
    let config: SideMenuConfig
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.sideMenuRightPanel.toggle()
            }
        }, label: {
            MenuIcon(icon: config.rightMenuItem, defaultAccentColor: .red, defaultImageName: "sidebar.right")
        })
    }
}
