//
//  OldestPhotosView.swift
//  SideMenu-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import SFSafeSymbols

struct OldestPhotosView: View, CenterView {
    @Binding var leftMenuState: Bool
    @Binding var rightMenuState: Bool
    
    @ObjectBinding var viewModel = PhotosViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                // loading indicator label
                if viewModel.isLoading {
                    List {
                        ForEach(1...3) { row in
                            ListPhotoRow(shouldShimmer: true)
                        }
                    }
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                } else if viewModel.errorMessage.isEmpty {
                    List(viewModel.photos) { photo in
                        ListPhotoRow(photo: photo)
                    }
                }
            }
            .navigationBarTitle("Oldest", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    withAnimation {
                        self.leftMenuState.toggle()
                    }
                }, label: {
                    Image(systemName: SFSymbol.lineHorizontal3.rawValue)
                        .accentColor(.blue)
                        .imageScale(.large)
                }),
                trailing: Button(action: {
                    withAnimation {
                        self.rightMenuState.toggle()
                    }
                }, label: {
                    Image(systemName: SFSymbol.lineHorizontal3.rawValue)
                        .accentColor(.red)
                        .imageScale(.large)

                })
            )
        }
    }
    
    // MARK: - Private
    
    private func fetchData() {
        self.viewModel.fetchPhotos(orderBy: .oldest)
    }
    
    init(leftMenuState: Binding<Bool>? = nil, rightMenuState: Binding<Bool>? = nil) {
        self.$leftMenuState = leftMenuState ?? .constant(false)
        self.$rightMenuState = rightMenuState ?? .constant(false)
        fetchData()
    }
}

#if DEBUG
struct OldestPhotosView_Previews : PreviewProvider {
    static var previews: some View {
        OldestPhotosView(leftMenuState: .constant(false), rightMenuState: .constant(false))
    }
}
#endif






