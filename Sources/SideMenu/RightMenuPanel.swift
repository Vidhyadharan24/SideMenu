//
//  RightMenuPanel.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 22/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct RightMenuPanel: View {
    @Environment(\.sideMenuRightPanelKey) var sideMenuRightPanel
    @Environment(\.sideMenuCenterViewKey) var sideMenuCenterView

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Text("Hello World!")
                Button(action: {
                    withAnimation {
                        self.sideMenuCenterView.wrappedValue = AnyView(CenterView())
                        self.sideMenuRightPanel.wrappedValue = false
                    }
                }, label: {
                    Text("Update center view")
                        .foregroundColor(.black)
                })
                Spacer()
            }
        }
        .background(Color.red)
            .background(Rectangle().shadow(radius: 4))
    }
}

#if DEBUG
struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LeftMenuPanel()
            RightMenuPanel()
        }
    }
}
#endif
