//
//  PopularPhotosView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct PopularPhotosView: View {    
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        PhotosView(viewModel: viewModel)
        .navigationBarTitle("Popular", displayMode: .inline)
        .onAppear {
            self.fetchData()
        }
    }
    
    // MARK: - Private
    
    private func fetchData() {
        self.viewModel.fetchPhotos(orderBy: .popular)
    }
}

#if DEBUG
struct PopularPhotosView_Previews : PreviewProvider {
    static var previews: some View {
        PopularPhotosView()
    }
}
#endif
