//
//  CenterView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 12/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct CenterView : View {
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @Environment(\.sideMenuRightPanelKey) var sideMenuRightPanel

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Button(action: {
                    withAnimation {
                        self.sideMenuLeftPanel.wrappedValue = !self.sideMenuLeftPanel.wrappedValue
                    }
                }, label: {
                    Text("Show left menu") })
                
                Button(action: {
                    withAnimation {
                        self.sideMenuRightPanel.wrappedValue = !self.sideMenuRightPanel.wrappedValue
                    }
                }, label: {
                    Text("Show right menu") })
            }
            .navigationBarTitle(Text("Center View"))
        }
    }
}

#if DEBUG
struct CenterView_Previews : PreviewProvider {
    static var previews: some View {
        CenterView()
    }
}
#endif
