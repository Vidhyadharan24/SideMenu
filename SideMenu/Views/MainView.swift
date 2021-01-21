//
//  MainView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 18/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct CustomIcon: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .accentColor(.green)
            .imageScale(.large)
    }
}

struct MainView : View {
    let customIcons =
        SideMenuConfig(
            leftMenuItem:
                .custom(
                    AnyView(CustomIcon(systemName: "square"))
                ),
            rightMenuItem:
                .custom(
                    AnyView(CustomIcon(systemName: "trash"))
                )
        )
        
    let noIconOnRight =
        SideMenuConfig(
            leftMenuItem:
                .custom(
                    AnyView(CustomIcon(systemName: "square"))
                ),
            rightMenuItem: .none
        )
 
    // App needs to use `.navigationBarItems` to setup menu items. See SideMenuConfig.swift.
    let noIcons =
        SideMenuConfig(
            leftMenuItem: .none,
            rightMenuItem: .none
        )
        
    let regularConfig = SideMenuConfig()
        
    var body: some View {
        SideMenu(leftMenu: LeftMenu(),
                 rightMenu: RightMenu(),
                 centerView: PhotosView(orderBy: .latest), config: regularConfig)
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
