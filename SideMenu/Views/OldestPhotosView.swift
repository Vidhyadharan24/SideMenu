//
//  OldestPhotosView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct OldestPhotosView: View {    
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        PhotosView(viewModel: viewModel)
        .navigationBarTitle("Oldest", displayMode: .inline)
        .onAppear {
            self.fetchData()
        }
    }
    
    // MARK: - Private
    
    private func fetchData() {
        self.viewModel.fetchPhotos(orderBy: .oldest)
    }
}

#if DEBUG
struct OldestPhotosView_Previews : PreviewProvider {
    static var previews: some View {
        OldestPhotosView()
    }
}
#endif
