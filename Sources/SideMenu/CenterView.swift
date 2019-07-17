//
//  CenterView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 12/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public protocol CenterView: View {
    
    init(leftMenuState: Binding<Bool>?, rightMenuState: Binding<Bool>?)
    
}

internal struct CenterMenuView : View, CenterView {
    @Binding var leftMenuState: Bool
    @Binding var rightMenuState: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {                
                Button(action: {
                    withAnimation {
                        self.leftMenuState.toggle()
                    }
                }, label: { Text("Show left menu") })
                
                Button(action: {
                    withAnimation {
                        self.rightMenuState.toggle()
                    }
                }, label: { Text("Show right menu") })
            }
            .navigationBarTitle(Text("Center View"))
        }
    }
    
    init(leftMenuState: Binding<Bool>? = nil, rightMenuState: Binding<Bool>? = nil) {
        self.$leftMenuState = leftMenuState ?? .constant(false)
        self.$rightMenuState = rightMenuState ?? .constant(false)
    }
}

#if DEBUG
struct CenterView_Previews : PreviewProvider {
    static var previews: some View {
        CenterMenuView(leftMenuState: .constant(false), rightMenuState: .constant(false))
    }
}
#endif







