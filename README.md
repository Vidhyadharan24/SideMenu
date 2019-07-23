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

SideMenu takes two boolean bindings, two panel views for the left and right menu, a view binding for the center view and an instance of SideMenuConfig class as paramenters, depending on the requirments of the project SideMenu can be initialized with either the left or right panel.

```swift
import SideMenu 

struct MainView : View {
    
    // Declare a state variable for center view
    // the initial value is set as nil to break the dependancy cycle between the menus and the center view 
    @State var centerView: AnyView? = nil
    
    // Declare a state variable for left menu state
    @State var showLeftMenu: Bool = false
    // Declare a state variable for right menu state
    @State var showRightMenu: Bool = false
    
    var body: some View {
    	// Initialize the left and right menus
    	let leftMenu = LeftMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu,
                                centerView: $centerView)
        let rightMenu = RightMenu(showLeftMenu: $showLeftMenu, showRightMenu: $showRightMenu,
                                  centerView: $centerView)
        // Initialize the SideMenu 
        return SideMenu(leftMenu: leftMenu, showLeftMenu: $showLeftMenu,
                        rightMenu: rightMenu, showRightMenu: $showRightMenu,
                        centerView: $centerView)
            .onAppear {
                withAnimation {
                	// In .onAppear set the initial view to be presented as center view 
                    self.centerView = AnyView(LatestPhotosView(leftMenuState: self.$showLeftMenu,
                                                               rightMenuState: self.$showRightMenu))
                }
        }
    }
    
}
```



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
    
    // Disables screen edge drag gestures to present a menu. Default is true
    public var disableDragGesture: Bool
```


## Known Issues

* Even though the performance of the left or right menu drag gesture has improved in beta 4, it's far from ideal. The performance of the drag gesture will improve with each new beta.

## ShimmerView
For the shimmering effect go to `https://github.com/Vidhyadharan-Mohanram/ShimmerView` for more details.