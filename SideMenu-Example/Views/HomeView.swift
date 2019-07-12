//
//  HomeView.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct HomeView: View, CenterView {
    @Binding var leftMenuState: Bool
    @Binding var rightMenuState: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Button(action: {
                    withAnimation(.basic(duration: 4)) {
                        self.leftMenuState.toggle()
                    }
                }, label: { Text("Show left menu") })
                
                Button(action: {
                    withAnimation(.basic(duration: 4)) {
                        self.rightMenuState.toggle()
                    }
                }, label: { Text("Show right menu") })
                }
                .navigationBarTitle(Text("Side Menu"))
        }
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView(leftMenuState: .constant(false), rightMenuState: .constant(false))
    }
}
#endif
