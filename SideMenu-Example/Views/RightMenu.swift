//
//  RightMenu.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct RightMenu: View {
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
            }
        }
        .background(Color.red)
        .background(Rectangle().shadow(radius: 4))
    }
    
    init(showLeftMenu: Binding<Bool> = .constant(false), showRightMenu: Binding<Bool> = .constant(false), centerView: Binding<AnyView?>) {
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu
        
        self._centerView = centerView
    }
}

#if DEBUG
struct RightMenu_Previews : PreviewProvider {
    static var previews: some View {
        RightMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
    }
}
#endif
