//
//  ViewState.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 18/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import UIKit

enum ViewState<T> {
    case loading
    case completedWithNoData
    case completed(response: T)
    case failed(error: String)
}
