//
//  LeftMenuPanel.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 22/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//


import SwiftUI

internal struct LeftMenuPanel: View {
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
                        self.centerView = AnyView(CenterView(leftMenuState: self._showLeftMenu, rightMenuState: self._showRightMenu))
                        self.showLeftMenu.toggle()
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
    
    init(showLeftMenu: Binding<Bool> = .constant(false), showRightMenu: Binding<Bool> = .constant(false), centerView: Binding<AnyView?>) {
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu

        self._centerView = centerView
    }
}
