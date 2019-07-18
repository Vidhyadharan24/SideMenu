//
//  LeftMenu.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct LeftMenu: View, MenuView {
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
                        self.centerView = AnyView(PopularPhotosView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                        self.showLeftMenu.toggle()
                    }
                }, label: {
                    Text("Show Popular Photos").color(.black) })
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

#if DEBUG
struct LeftMenu_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LeftMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
                .previewDevice("iPhone Xs")
                .environment(\.colorScheme, .dark)
            LeftMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
        }
    }
}
#endif
