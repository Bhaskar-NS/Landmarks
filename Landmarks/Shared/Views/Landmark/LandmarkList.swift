//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bhaskar on 06/01/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modalData: ModalData
    @State private var showFavouritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modalData.landmarks.filter { landmark in
            (!showFavouritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavouritesOnly) {
                    Text("Favorites only")
                }
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModalData())
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName
//                )
//        }
    }
}
