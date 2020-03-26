//
//  LeftMenuPanel.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 22/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct LeftMenuPanel: View {
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @Environment(\.sideMenuCenterViewKey) var sideMenuCenterView

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Text("Hello World!")
                Button(action: {
                    withAnimation {
                        self.sideMenuCenterView.wrappedValue = AnyView(CenterView())
                        self.sideMenuLeftPanel.wrappedValue = false
                    }
                }, label: {
                    Text("Update center view")
                        .foregroundColor(.black)
                })
                Spacer()
            }
        }
        .background(Color.blue)
        .background(Rectangle().shadow(radius: 4))
    }
}
