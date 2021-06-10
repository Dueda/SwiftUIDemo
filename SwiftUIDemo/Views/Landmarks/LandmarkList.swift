//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by dueda on 2021/5/28.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData:ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        /*
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
 */
        NavigationView {
            
//            List(filteredLandmarks) { landmark in
//                NavigationLink(
//                    destination: LandmarkDetail(landmark: landmark)) {
//                    LandmarkRow(landmark: landmark)
//                }
//
//            }
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                    ) {
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
        //选择设备
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarkList().environmentObject(ModelData())
        
    }
}
