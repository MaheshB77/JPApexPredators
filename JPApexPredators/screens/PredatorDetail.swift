//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 29/12/25.
//

import SwiftUI

struct PredatorDetail: View {
    var predator: ApexPredator

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
        }.ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: PredatorService().apexPredators[7])
        .preferredColorScheme(.dark)
}
