//
//  IfConditional.swift
//  SideMenu
//
//  Created by Christopher G Prince on 1/20/21.
//  Copyright © 2021 Vid. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    // https://forums.swift.org/t/conditionally-apply-modifier-in-swiftui/32815/16
	@ViewBuilder func `if`<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T : View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
}
