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
    
    @ObjectBinding var photoLoaderViewModel: PhotoLoaderViewModel
    
    let urlString: String?
    let shouldShimmer: Bool
    
    var body: some View {
        containedView()
    }
    
    init(urlString: String?, shouldShimmer: Bool) {
        self.photoLoaderViewModel = PhotoLoaderViewModel(urlString: urlString)
        self.urlString = urlString
        self.shouldShimmer = shouldShimmer
        fetchImage()
    }
    
    func fetchImage() {
        self.photoLoaderViewModel.fetchImage(urlString: self.urlString)
    }
    
    func containedView() -> AnyView {
        let image: UIImage
        let shouldShowShimmer: Bool
        switch photoLoaderViewModel.state {
        case .loading:
            shouldShowShimmer = true
            image = #imageLiteral(resourceName: "placeholder")
        case .completedWithNoData:
            shouldShowShimmer = false
            image = #imageLiteral(resourceName: "placeholder")
        case .completed(let loadedImage):
            shouldShowShimmer = false
            image = loadedImage
        case .failed(_):
            shouldShowShimmer = false
            image = #imageLiteral(resourceName: "placeholder")
        }
        
        return AnyView(Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .shimmer(isActive: shouldShimmer || shouldShowShimmer))
    }
}

