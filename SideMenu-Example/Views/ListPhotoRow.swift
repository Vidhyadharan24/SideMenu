//
//  ListPhotoRow.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct ListPhotoRow : View {
    
    var shouldShimmer: Bool = false
    
    var photo: Photo?
    
    var body: some View {
        NetworkImageView(urlString: self.photo?.urls.regular, shouldShimmer: self.shouldShimmer)
            .frame(height: 250)
            .clipped()
//            .cornerRadius(5)
            .shadow(radius: 5)
    }
}


#if DEBUG
struct ListPhotoRow_Previews : PreviewProvider {
    static var previews: some View {
        ListPhotoRow()
    }
}
#endif
