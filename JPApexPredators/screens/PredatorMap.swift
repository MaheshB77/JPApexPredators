//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 29/12/25.
//

import MapKit
import SwiftUI

struct PredatorMap: View {
    @State var position: MapCameraPosition
    @State var satelliteView = false
    let predators = PredatorService().apexPredators

    var body: some View {
        Map(position: $position) {
            ForEach(predators) { predator in
                Annotation(
                    predator.name,
                    coordinate: predator.location
                ) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 2)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(
            satelliteView
                ? .imagery(elevation: .realistic)
                : .standard(elevation: .realistic)
        )
        .overlay(alignment: .bottomTrailing) {
            Button {
                satelliteView.toggle()
            } label: {
                
                Image(
                    systemName: satelliteView
                        ? "globe.americas.fill" : "globe.americas"
                )
                .font(.largeTitle)
                .padding()
            }
        }
    }
}

#Preview {
    let predator = PredatorService().apexPredators[2]
    PredatorMap(
        position: .camera(
            MapCamera(
                centerCoordinate: predator.location,
                distance: 1000,
                heading: 250,
                pitch: 80
            )
        )
    )
    .preferredColorScheme(.dark)
}
