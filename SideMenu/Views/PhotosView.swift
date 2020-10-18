//
//  PhotosView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 18/10/20.
//  Copyright © 2020 Vid. All rights reserved.
//

import SwiftUI

struct PhotosView: View {
    @ObservedObject var viewModel: PhotosViewModel

    var body: some View {
        let view: AnyView
        switch viewModel.state {
        case .loading:
            view = AnyView(List {
                ForEach(1..<4) { _ in
                    ListPhotoRow(shouldShimmer: true)
                }
            }
            .listStyle(PlainListStyle()))
        case .completedWithNoData:
            view = AnyView(Text("No photos"))
        case .completed(let photos):
            view = AnyView(List(photos) { photo in
                ListPhotoRow(photo: photo)
            }
            .listStyle(PlainListStyle()))
        case .failed(let errorMessage):
            view = AnyView(Text(errorMessage)
                .lineLimit(nil)
                .multilineTextAlignment(.center))
        }
        
        return view
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(viewModel: PhotosViewModel())
    }
}
