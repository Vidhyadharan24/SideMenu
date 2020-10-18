//
//  LatestPhotosView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct LatestPhotosView: View {    
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        PhotosView(viewModel: viewModel)
        .navigationBarTitle("Latest", displayMode: .inline)
        .onAppear {
            self.fetchData()
        }
    }
    
    // MARK: - Private
    
    private func fetchData() {
        self.viewModel.fetchPhotos(orderBy: .latest)
    }
}

#if DEBUG
struct LatestPhotosView_Previews : PreviewProvider {
    static var previews: some View {
        LatestPhotosView()
    }
}
#endif
