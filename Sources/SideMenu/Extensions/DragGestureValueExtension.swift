//
//  DragGestureValueExtension.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 21/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

enum DragDirection {
    case left
    case right
    case up
    case down
}

extension DragGesture.Value {

    var dragDirection: DragDirection {
        if startLocation.x > location.x {
            return DragDirection.left
        } else if startLocation.x < location.x {
            return DragDirection.right
        } else if startLocation.y < location.y {
            return DragDirection.up
        } else {
            return DragDirection.down
        }
    }
    
}
