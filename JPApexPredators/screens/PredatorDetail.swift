//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 29/12/25.
//

import MapKit
import SwiftUI

struct PredatorDetail: View {
    var predator: ApexPredator
    @State var position: MapCameraPosition
    @Namespace var namespace

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFill()
                        .overlay {
                            LinearGradient(
                                stops: [
                                    .init(
                                        color: .clear,
                                        location: 0.8
                                    ),
                                    .init(color: .black, location: 1),
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }

                    // Dino image

                    Image(predator.image)
                        .resizable()
                        .scaledToFill()
                        .offset(y: 20)
                        .frame(
                            width: geo.size.width / 1.5,
                            height: geo.size.width / 2
                        )
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 8)

                }

                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)

                    // Current location
                    NavigationLink {
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
                        .navigationTransition(
                            .zoom(sourceID: 1, in: namespace)
                        )

                    } label: {
                        Map(position: $position) {
                            Annotation(
                                predator.name,
                                coordinate: predator.location
                            ) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        .frame(height: 120)
                        .clipShape(.rect(cornerRadius: 12))
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.bottom, .leading, .trailing], 8)
                                .padding(.top, 4)
                                .background(.black.opacity(0.5))
                                .clipShape(.rect(bottomTrailingRadius: 12))
                        }
                        .clipShape(.rect(cornerRadius: 12))
                        .allowsHitTesting(false)  // Used to prevent the map interaction
                        .matchedTransitionSource(id: 1, in: namespace)
                    }

                    // Appears in
                    Text("Apprears in : ")
                        .font(.title3)
                        .padding(.top, 4)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("⦿ " + movie)
                            .font(.subheadline)
                    }

                    // Movie moments
                    Text("Movie Moments")
                        .font(.title3)
                        .padding(.top, 8)
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.headline)

                        Text(scene.sceneDescription)
                            .padding(.bottom)
                    }

                    // Link to webpage
                    Text("Read more")
                        .font(.caption)
                    Link(
                        predator.link,
                        destination: URL(string: predator.link)!
                    )
                    .font(.caption)
                    .foregroundStyle(.blue)

                }
                .padding()
                .padding(.top)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .padding(.bottom)
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
    }
}

#Preview {
    let predator = PredatorService().apexPredators[7]
    NavigationStack {
        PredatorDetail(
            predator: predator,
            position: .camera(
                MapCamera(
                    centerCoordinate: predator.location,
                    distance: 30000
                )
            )
        )
        .preferredColorScheme(.dark)
    }

}
