//
//  MainView.swift
//  SideMenu-Example
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
        let leftMenu = LeftMenu()
        let rightMenu = RightMenu()
        
        let defaultView = AnyView(LatestPhotosView())
        
        return SideMenu(leftMenu: leftMenu,
                        rightMenu: rightMenu,
                        centerView: defaultView)
            .environmentObject(ShimmerConfig())
    }
    
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
