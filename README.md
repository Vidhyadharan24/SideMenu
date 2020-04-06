# SideMenu

## Overview

SideMenu is a simple side menu Navigation control written in SwiftUI for SwiftUI

### Preview Samples
| Left Panel | Right Panel |
| --- | --- |
| ![](https://raw.githubusercontent.com/Vidhyadharan-Mohanram/SideMenu/master/etc/LeftPanel.gif) | ![](https://raw.githubusercontent.com/Vidhyadharan-Mohanram/SideMenu/master/etc/RightPanel.gif) |

## Requirements
- [x] Xcode 11
- [x] Swift 5.1
- [x] iOS 13 or higher.

## Installation
### Swift Package Manager

Select the project in Navigator, go to the Swift Packages tab and add the following url 

```
https://github.com/Vidhyadharan-Mohanram/SideMenu
```

## Usage
### Initialization

SideMenu takes a single view binding for the center view and an instance of SideMenuConfig class as paramenters, depending on the requirments SideMenu can be initialized with either the left, right or both panel.

```swift
import SideMenu 

struct MainView : View {
    var body: some View {
        SideMenu(leftMenu: LeftMenu(),
                 rightMenu: RightMenu(),
                 centerView: LatestPhotosView())
            .environmentObject(ShimmerConfig())
    }
}
```

## Toggling panels
SideMenu exposes the panel state using environment values, to show or hide a given panel declare the relevant environment variable and update the environment variables wrapped value.

```swift
import SideMenu

struct MyView: View {
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    ...
    var body: some View {
    	...
	   self.sideMenuLeftPanel.wrappedValue = true
    	...
    }
}
```

similary the panel gesture can be enabled or disabled using the environment key (\.sideMenuGestureModeKey)

## Customization
### SideMenuConfig

`SideMenuConfig` supports the following customizations

```swift
    // color of the background view. Default is Color.black
    public var menuBGColor: Color
	
    // The opacity of the menu background view. Default is 0.3
    public var menuBGOpacity: Double
    
    // The width of the menu. Default is 300
    public var menuWidth: Length
    
    // The duration taken by the menu to slide out. Default is 0.3
    public var animationDuration: Double    
```


## Known Issues

* Shimmers when active causes the simulator and mac OS to stutter. Run the example app in device to prevent stuttering.

## ShimmerView
For the shimmering effect go to `https://github.com/Vidhyadharan-Mohanram/ShimmerView` for more details.
