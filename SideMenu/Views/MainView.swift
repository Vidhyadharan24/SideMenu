//
//  MainView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 18/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct MainView : View {
    var body: some View {
        SideMenu(leftMenu: LeftMenu(),
                 rightMenu: RightMenu(),
                 centerView: LatestPhotosView())
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
