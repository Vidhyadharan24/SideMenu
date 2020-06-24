//
//  SideMenuEnvironment.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 06/04/20.
//  Copyright © 2020 Vid. All rights reserved.
//

import SwiftUI

public enum SideMenuGestureMode {
    case active
    case inactive
}

struct SideMenuGestureModeKey: EnvironmentKey {
    static let defaultValue: Binding<SideMenuGestureMode> = Binding.constant(SideMenuGestureMode.active)
}

struct SideMenuLeftPanelKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = Binding.constant(false)
}

struct SideMenuRightPanelKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = Binding.constant(false)
}

struct SideMenuCenterViewKey: EnvironmentKey {
    static let defaultValue: Binding<AnyView> = Binding.constant(AnyView(EmptyView()))
}

extension EnvironmentValues {
    public var sideMenuGestureModeKey: Binding<SideMenuGestureMode> {
        get {
            return self[SideMenuGestureModeKey.self]
        }
        set {
            self[SideMenuGestureModeKey.self] = newValue
        }
    }
    
    public var sideMenuLeftPanelKey: Binding<Bool> {
        get {
            return self[SideMenuLeftPanelKey.self]
        }
        set {
            self[SideMenuLeftPanelKey.self] = newValue
        }
    }
    
    public var sideMenuRightPanelKey: Binding<Bool> {
        get {
            return self[SideMenuRightPanelKey.self]
        }
        set {
            self[SideMenuRightPanelKey.self] = newValue
        }
    }
    
    public var sideMenuCenterViewKey: Binding<AnyView> {
        get {
            return self[SideMenuCenterViewKey.self]
        }
        set {
            self[SideMenuCenterViewKey.self] = newValue
        }
    }
}
