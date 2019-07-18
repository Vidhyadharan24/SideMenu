//
//  MainView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 18/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import ShimmerView

struct MainView : View {
    
    @State var centerView: AnyView? = nil
    
    @State var showLeftMenu: Bool = false
    @State var showRightMenu: Bool = false
    
    var body: some View {
        let leftMenu = LeftMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu, centerView: $centerView)
        let rightMenu = RightMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu, centerView: $centerView)
        
        return SideMenu(leftMenu: leftMenu, showLeftMenu: $showLeftMenu,
                        rightMenu: rightMenu, showRightMenu: $showRightMenu,
                        centerView: $centerView)
            .environmentObject(ShimmerConfig())
            .onAppear {
                withAnimation {
                    self.centerView = AnyView(LatestPhotosView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
                }
        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
