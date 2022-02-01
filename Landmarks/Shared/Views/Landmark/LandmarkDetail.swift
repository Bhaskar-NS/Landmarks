//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Bhaskar on 06/01/22.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    @EnvironmentObject var modalData: ModalData
    var landmarkIndex: Int {
        modalData.landmarks.firstIndex { $0.id == landmark.id }!
    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: [.top])
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modalData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModalData()
    static var previews: some View {
        LandmarkDetail(landmark: ModalData().landmarks[0])
            .environmentObject(modelData)
    }
}
