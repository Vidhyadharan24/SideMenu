//
//  CenterView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 12/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

internal struct CenterView : View {
    @Binding var leftMenuState: Bool
    @Binding var rightMenuState: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {                
                Button(action: {
                    withAnimation {
                        self.leftMenuState.toggle()
                    }
                }, label: {
                    Text("Show left menu") })
                
                Button(action: {
                    withAnimation {
                        self.rightMenuState.toggle()
                    }
                }, label: {
                    Text("Show right menu") })
            }
            .navigationBarTitle(Text("Center View"))
        }
    }
    
    init(leftMenuState: Binding<Bool> = .constant(false), rightMenuState: Binding<Bool> = .constant(false)) {
        self._leftMenuState = leftMenuState
        self._rightMenuState = rightMenuState
    }
}

#if DEBUG
struct CenterView_Previews : PreviewProvider {
    static var previews: some View {
        CenterView(leftMenuState: .constant(false), rightMenuState: .constant(false))
    }
}
#endif
