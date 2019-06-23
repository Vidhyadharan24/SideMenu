//
//  LeftMenu.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import SideMenu

internal struct LeftMenu: View, MenuView {
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
                        self.centerView = AnyView(HomeView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
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

#if DEBUG
struct LeftMenu_Previews : PreviewProvider {
    static var previews: some View {
        LeftMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
    }
}
#endif
