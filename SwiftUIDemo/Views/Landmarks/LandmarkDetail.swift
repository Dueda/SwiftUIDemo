//
//  LandmarkDetail.swift
//  SwiftUIDemo
//
//  Created by dueda on 2021/5/28.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate).frame(height:300).ignoresSafeArea(edges: .top)
                CircleImage(image: landmark.image).offset(y:-130).padding(.bottom,-130)
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    HStack {
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                    Divider()
                    Text("About \(landmark.name)")

                        .font(.title2)

                    Text(landmark.description)
                }
                .padding()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
