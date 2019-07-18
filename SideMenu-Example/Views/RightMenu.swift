//
//  RightMenu.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct RightMenu: View, MenuView {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    
    @Binding var centerView: AnyView?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Text("Hello World!")
                    .foregroundColor(Color.black)
                Button(action: {
                    withAnimation {
                        self.centerView = AnyView(OldestPhotosView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                        self.showRightMenu.toggle()
                    }
                }, label: {
                    Text("Show Old Photos")
                        .foregroundColor(Color.black)
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
struct RightMenu_Previews : PreviewProvider {
    static var previews: some View {
        RightMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
    }
}
#endif
