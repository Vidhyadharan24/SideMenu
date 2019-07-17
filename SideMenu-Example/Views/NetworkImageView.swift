//
//  NetworksImageView.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 14/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import ShimmerView

struct NetworkImageView: View {
    
    @ObjectBinding var photoListViewModel: PhotoLoaderViewModel
    
    let urlString: String?
    let shouldShimmer: Bool
    
    var body: some View {
        Image(uiImage: photoListViewModel.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .shimmer(isActive: shouldShimmer || self.photoListViewModel.isLoading)
    }
    
    init(urlString: String?, shouldShimmer: Bool) {
        self.photoListViewModel = PhotoLoaderViewModel(urlString: urlString)
        self.urlString = urlString
        self.shouldShimmer = shouldShimmer
        fetchImage()
    }
    
    func fetchImage() {
        self.photoListViewModel.fetchImage(urlString: self.urlString)
    }
    
}

