//
//  PhotosView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 18/10/20.
//  Copyright © 2020 Vid. All rights reserved.
//

import SwiftUI

struct PhotosView: View {
    var orderBy: PhotosEndPoint.OrderBy;
    @ObservedObject private var viewModel: PhotosViewModel = PhotosViewModel()

    
    init(orderBy: PhotosEndPoint.OrderBy) {
        self.orderBy = orderBy
        
        self.fetchData()
    }
    
    var body: some View {
        self.containedView()
            .navigationBarTitle(self.orderBy.rawValue.capitalized, displayMode: .inline)
    }
    
    func containedView() -> AnyView {
        let view: AnyView
        switch viewModel.state {
        case .loading:
            view = AnyView(ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                LazyVStack(spacing: 0) {
                    ForEach(1..<4) { _ in
                        ListPhotoRow(shouldShimmer: true)
                    }
                }.padding(.vertical, 5)
            }))
        case .completedWithNoData:
            view = AnyView(Text("No photos"))
        case .completed(let photos):
            view = AnyView(ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                LazyVStack(spacing: 0) {
                    ForEach(photos) { photo in
                        ListPhotoRow(photo: photo)
                    }
                }.padding(.vertical, 5)
            }))
        case .failed(let errorMessage):
            view = AnyView(Text(errorMessage)
                .lineLimit(nil)
                .multilineTextAlignment(.center))
        }
                
        return view
    }
    
    // MARK: - Private
    
    private func fetchData() {
        self.viewModel.fetchPhotos(orderBy: self.orderBy)
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(orderBy: .latest)
    }
}
