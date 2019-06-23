//
//  CenterView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 12/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public protocol CenterView {
    
    init(leftMenuState: Binding<Bool>, rightMenuState: Binding<Bool>)
    
}

internal struct CenterMenuView : View, CenterView {
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
            .navigationBarTitle(Text("Center View"))
        }
    }
}

#if DEBUG
struct CenterView_Previews : PreviewProvider {
    static var previews: some View {
        CenterMenuView(leftMenuState: .constant(false), rightMenuState: .constant(false))
    }
}
#endif







