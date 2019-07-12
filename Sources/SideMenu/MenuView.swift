//
//  MenuView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 12/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public protocol MenuView: View {
    
    init(showLeftMenu: Binding<Bool>, showRightMenu: Binding<Bool>, centerView: Binding<AnyView?>)
    
}

internal struct LeftMenuPanel: View, MenuView {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool

    @Binding var centerView: AnyView?
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack(spacing: 10) {
                    Spacer()
                    Text("Hello World!")
                    Button(action: {
                        self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                        self.showLeftMenu.toggle()
                    }, label: { Text("Update center view").color(.black) })
                    Spacer()
                }.layoutPriority(1)
                Spacer()
                }
                .background(Color.blue)
                .background(Rectangle().shadow(radius: 4))
        }
    }
}

internal struct RightMenuPanel: View, MenuView {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool

    @Binding var centerView: AnyView?
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack(spacing: 10) {
                    Spacer()
                    Text("Hello World!")
                    Button(action: {
                        self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                        self.showRightMenu.toggle()
                    }, label: { Text("Update center view").color(.black) })
                    Spacer()
                    }.layoutPriority(1)
                Spacer()
                }
                .background(Color.red)
                .background(Rectangle().shadow(radius: 4))
        }
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
