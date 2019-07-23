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

Select the project in Navigator, go to the Swift Packages tab and that the url 

```
https://github.com/Vidhyadharan-Mohanram/SideMenu
```

## Usage
### Initialization

Side Menu takes two boolean bindings, two panel views and a view binding for the center view as parameters, depending on the requirment of the project a 

``` swift
import SideMenu 

struct MainView : View {
    
    @State var centerView: AnyView? = nil
    
    @State var showLeftMenu: Bool = false
    @State var showRightMenu: Bool = false
    
    var body: some View {
        let leftMenu = LeftMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu,
                                centerView: $centerView)
        let rightMenu = RightMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu,
                                  centerView: $centerView)
        
        return SideMenu(leftMenu: leftMenu, showLeftMenu: $showLeftMenu,
                        rightMenu: rightMenu, showRightMenu: $showRightMenu,
                        centerView: $centerView)
            .onAppear {
                withAnimation {
                    self.centerView = AnyView(LatestPhotosView(leftMenuState: self.$showLeftMenu,
                                                               rightMenuState: self.$showRightMenu))
                }
        }
    }
    
}
```



### Customization
#### SideMenuConfig

## Known Issues