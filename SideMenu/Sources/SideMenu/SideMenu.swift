//
//  ContentView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 11/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public struct SideMenu : View {
    
    //  MARK: Custom initializers
    
    public init<Menu: MenuView>(leftMenu: Menu, showLeftMenu: Binding<Bool>,
                                centerView: Binding<AnyView?>, config: SideMenuConfig = SideMenuConfig()) {
        self.$showLeftMenu = showLeftMenu
        
        self.$showRightMenu = .constant(false)
        
        self.$centerView = centerView
        
        self.leftMenu = AnyView(leftMenu)
        
        self.config = config
    }
    
    public init<Menu: MenuView>(rightMenu: Menu, showRightMenu: Binding<Bool>,
                                centerView: Binding<AnyView?>, config: SideMenuConfig = SideMenuConfig()) {
        self.$showLeftMenu = .constant(false)
        self.$showRightMenu = showRightMenu
        
        self.$centerView = centerView
        
        self.rightMenu = AnyView(rightMenu)
        
        self.config = config
    }
    
    public init<LMenu: MenuView, RMenu: MenuView>(leftMenu: LMenu, showLeftMenu: Binding<Bool>,
                                                  rightMenu: RMenu, showRightMenu: Binding<Bool>,
                                                  centerView: Binding<AnyView?>, config: SideMenuConfig = SideMenuConfig()) {
        self.$showLeftMenu = showLeftMenu
        self.$showRightMenu = showRightMenu
        self.$centerView = centerView
        
        self.leftMenu = AnyView(leftMenu)
        self.rightMenu = AnyView(rightMenu)
        
        self.config = config
    }
    
    private var leftMenu: AnyView? = nil
    private var rightMenu: AnyView? = nil
    
    @Binding private var showLeftMenu: Bool
    @Binding private var showRightMenu: Bool
    
    @Binding private var centerView: AnyView?
    
    private var config: SideMenuConfig
    
    @State private var leftMenuBGOpacity: Double = 0
    @State private var rightMenuBGOpacity: Double = 0
    
    @State private var leftMenuOffsetX: CGFloat = -UIScreen.main.bounds.width
    @State private var rightMenuOffsetX: CGFloat = UIScreen.main.bounds.height
    
    private var menuAnimation: Animation {
        .basic(duration: self.config.animationDuration, curve: BasicAnimationTimingCurve.easeInOut)
    }
    
    private var screenWidth: Length {
        UIScreen.main.bounds.width
    }
    
    private var menuXOffset: Length {
        return (screenWidth - (self.config.menuWidth))/2
    }
    
    public var body: some View {
        let menuOpenGesture = DragGesture()
            .onChanged { (value) in
                self.onChangedDragGesture(value: value)
            }.onEnded { (value) in
                self.onEndedDragGesture(value: value)
        }
        
        return GeometryReader { geometry in
            ZStack(alignment: .top) {
                self.centerView?
                    .opacity(1)
                    .transition(.opacity)
                    .layoutPriority(1)
                    .gesture(menuOpenGesture)
                
                if self.showLeftMenu {
                    MenuBackgroundView(showLeftMenu: self.$showLeftMenu,
                                       showRightMenu: self.$showRightMenu)
                        .frame(width: geometry.actualScreenSize.width,
                               height: geometry.actualScreenSize.height)
                        .opacity(self.leftMenuBGOpacity)
                        .zIndex(1)
                        .gesture(menuOpenGesture)
                    
                    self.leftMenu?
                        .edgesIgnoringSafeArea(Edge.Set.all)
                        .frame(width: self.config.menuWidth,
                               height: geometry.actualScreenSize.height)
                        .offset(x: self.leftMenuOffsetX, y: 0)
                        .transition(.move(edge: Edge.leading))
                        .zIndex(2)
                        .gesture(menuOpenGesture)
                }
                
                if self.showRightMenu {
                    MenuBackgroundView(showLeftMenu: self.$showLeftMenu,
                                       showRightMenu: self.$showRightMenu)
                        .frame(width: geometry.actualScreenSize.width,
                               height: geometry.actualScreenSize.height)
                        .opacity(self.rightMenuBGOpacity)
                        .zIndex(3)
                        .gesture(menuOpenGesture)
                    
                    
                    self.rightMenu?
                        .edgesIgnoringSafeArea(Edge.Set.all)
                        .frame(width: self.config.menuWidth,
                               height: geometry.actualScreenSize.height)
                        .offset(x: self.rightMenuOffsetX, y: 0)
                        .transition(.move(edge: Edge.trailing))
                        .zIndex(4)
                        .gesture(menuOpenGesture)
                }
                }.animation(self.menuAnimation)
            }.onAppear {
                self.leftMenuOffsetX = -self.menuXOffset
                self.rightMenuOffsetX = self.menuXOffset
                self.leftMenuBGOpacity = self.config.menuBGOpacity
                self.rightMenuBGOpacity = self.config.menuBGOpacity
        }
    }
    
    //  MARK: Drag gesture methods
    
    func onChangedDragGesture(value: DragGesture.Value) {
        guard !self.config.disableDragGesture else { return }
        
        let startLocX = value.startLocation.x
        let translation = value.translation
        
        let translationWidth = translation.width > 0 ? translation.width : -(translation.width)
        
        let leftMenuGesturePositionX = screenWidth * 0.1
        let rightMenuGesturePositionX = screenWidth * 0.9
        
        guard translationWidth <= self.config.menuWidth else { return }
        
        if self.showLeftMenu, value.dragDirection == .left, self.leftMenu != nil {
            let newXOffset = -self.menuXOffset - translationWidth
            self.leftMenuOffsetX = newXOffset
            
            let translationPercentage = (self.config.menuWidth - translationWidth) / self.config.menuWidth
            guard translationPercentage > 0 else { return }
            self.leftMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        } else if self.showRightMenu, value.dragDirection == .right, self.rightMenu != nil {
            let newXOffset = self.menuXOffset + translationWidth
            self.rightMenuOffsetX = newXOffset
            
            let translationPercentage = (self.config.menuWidth - translationWidth) / self.config.menuWidth
            guard translationPercentage > 0 else { return }
            self.rightMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        } else if startLocX < leftMenuGesturePositionX, value.dragDirection == .right, self.leftMenu != nil {
            if !self.showLeftMenu {
                self.showLeftMenu.toggle()
            }
            
            let defaultOffset = -(self.menuXOffset + self.config.menuWidth)
            let newXOffset = defaultOffset + translationWidth
            
            self.leftMenuOffsetX = newXOffset
            
            let translationPercentage = translationWidth / self.config.menuWidth
            
            guard translationPercentage > 0 else { return }
            self.leftMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        } else if startLocX > rightMenuGesturePositionX, value.dragDirection == .left, self.rightMenu != nil {
            if !self.showRightMenu {
                self.showRightMenu.toggle()
            }
            
            let defaultOffset = self.menuXOffset + self.config.menuWidth
            let newXOffset = defaultOffset - translationWidth
            
            self.rightMenuOffsetX = newXOffset
            
            let translationPercentage = translationWidth / self.config.menuWidth
            guard translationPercentage > 0 else { return }
            self.rightMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        }
    }
    
    func onEndedDragGesture(value: DragGesture.Value) {
        guard !self.config.disableDragGesture else { return }
        
        let midXPoint = (0.5 * self.config.menuWidth)
        
        if self.showRightMenu, self.rightMenu != nil {
            let rightMenuMidX = self.menuXOffset + midXPoint
            
            if self.rightMenuOffsetX > rightMenuMidX {
                self.showRightMenu.toggle()
            }
            
            self.rightMenuOffsetX = self.menuXOffset
            self.rightMenuBGOpacity = self.config.menuBGOpacity
        } else if self.showLeftMenu, self.leftMenu != nil {
            let leftMenuMidX = -self.menuXOffset - midXPoint
            
            if self.leftMenuOffsetX < leftMenuMidX {
                self.showLeftMenu.toggle()
            }
            
            self.leftMenuOffsetX = -self.menuXOffset
            self.leftMenuBGOpacity = self.config.menuBGOpacity
        }
    }
    
}

//  MARK: Menu background view

struct MenuBackgroundView : View {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    
    var body: some View {
        Rectangle()
            .background(Color.black)
            .transition(.opacity)
            .tapAction {
                withAnimation() {
                    if self.showLeftMenu {
                        self.showLeftMenu.toggle()
                    }
                    
                    if self.showRightMenu {
                        self.showRightMenu.toggle()
                    }
                }
            }
            .edgesIgnoringSafeArea(Edge.Set.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    @State static var centerView: AnyView? = nil
    
    @State static var showLeftMenu: Bool = false
    @State static var showRightMenu: Bool = false
    
    static var previews: some View {
        let leftMenu = LeftMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu, centerView: $centerView)
        let rightMenu = RightMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu, centerView: $centerView)
        
        return Group {
            SideMenu(leftMenu: leftMenu, showLeftMenu: $showLeftMenu, centerView: $centerView).onAppear {
                self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
            }
            
            SideMenu(rightMenu: rightMenu, showRightMenu: $showRightMenu, centerView: $centerView).onAppear {
                self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
            }
            
            SideMenu(leftMenu: leftMenu, showLeftMenu: $showLeftMenu, rightMenu: rightMenu, showRightMenu: $showRightMenu, centerView: $centerView).onAppear {
                self.centerView = AnyView(CenterMenuView(leftMenuState: self.$showLeftMenu, rightMenuState: self.$showRightMenu))
            }
        }
    }
}
#endif







