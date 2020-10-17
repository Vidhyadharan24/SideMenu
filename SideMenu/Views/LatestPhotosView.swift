//
//  LatestPhotosView.swift
//  SideMenu
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import SFSafeSymbols

struct LatestPhotosView: View {
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @Environment(\.sideMenuRightPanelKey) var sideMenuRightPanel
    
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        NavigationView {
            containedView()
                .navigationBarTitle("Latest", displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        withAnimation {
                            self.sideMenuLeftPanel.wrappedValue = !self.sideMenuLeftPanel.wrappedValue
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .accentColor(.blue)
                            .imageScale(.large)
                    }),
                    trailing: Button(action: {
                        withAnimation {
                            self.sideMenuRightPanel.wrappedValue = !self.sideMenuRightPanel.wrappedValue
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .accentColor(.red)
                            .imageScale(.large)
                    })
                )
        }.onAppear {
            self.fetchData()
        }
    }
    
    func containedView() -> AnyView {
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
