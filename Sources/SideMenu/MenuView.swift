//
//  MenuView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 12/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public protocol MenuView: View {
    
    init(showLeftMenu: Binding<Bool>?, showRightMenu: Binding<Bool>?, centerView: Binding<AnyView?>)
    
}

internal struct LeftMenuPanel: View, MenuView {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    
    @Binding var centerView: AnyView?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Text("Hello World!")
                Button(action: {
                    withAnimation {
                        self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                        self.showLeftMenu.toggle()
                    }
                }, label: {
                    Text("Update center view")
                        .color(.black)
                })
                Spacer()
            }.relativeSize(width: 1, height: 1)
        }
        .background(Color.blue)
        .background(Rectangle().shadow(radius: 4))
    }
    
    init(showLeftMenu: Binding<Bool>? = nil, showRightMenu: Binding<Bool>? = nil, centerView: Binding<AnyView?>) {
        self.$showLeftMenu = showLeftMenu ?? .constant(false)
        self.$showRightMenu = showRightMenu ?? .constant(false)
        
        self.$centerView = centerView
    }
}

internal struct RightMenuPanel: View, MenuView {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    
    @Binding var centerView: AnyView?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Text("Hello World!")
                Button(action: {
                    withAnimation {
                        self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                        self.showRightMenu.toggle()
                    }
                }, label: {
                    Text("Update center view")
                        .color(.black)
                })
                Spacer()
            }.relativeSize(width: 1, height: 1)
        }
        .background(Color.red)
            .background(Rectangle().shadow(radius: 4))
    }
    
    init(showLeftMenu: Binding<Bool>? = nil, showRightMenu: Binding<Bool>? = nil, centerView: Binding<AnyView?>) {
        self.$showLeftMenu = showLeftMenu ?? .constant(false)
        self.$showRightMenu = showRightMenu ?? .constant(false)
        
        self.$centerView = centerView
    }
}

#if DEBUG
struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LeftMenuPanel(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
            RightMenuPanel(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
        }
    }
}
#endif
