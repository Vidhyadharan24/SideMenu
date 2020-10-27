//
//  RightMenu.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct RightMenu: View {
    @Environment(\.sideMenuRightPanelKey) var sideMenuRightPanel
    @Environment(\.sideMenuCenterViewKey) var sideMenuCenterView
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Text("Hello World!")
                    .foregroundColor(Color.black)
                Button(action: {
                    withAnimation {
                        self.sideMenuCenterView.wrappedValue = AnyView(PhotosView(orderBy: .oldest))
                        self.sideMenuRightPanel.wrappedValue = false
                    }
                }, label: {
                    Text("Show Old Photos")
                        .foregroundColor(Color.black)
                })
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .background(Color.red)
            .background(Rectangle().shadow(radius: 4))
        }
        
    }
}

#if DEBUG
struct RightMenu_Previews : PreviewProvider {
    static var previews: some View {
        RightMenu()
    }
}
#endif
