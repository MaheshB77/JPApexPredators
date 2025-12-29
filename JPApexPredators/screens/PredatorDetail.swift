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

                    // Dino image

                    Image(predator.image)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geo.size.width / 1.5,
                            height: geo.size.width / 3.6
                        )
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 8)
                }

                // Dino name

                // Current location

                // Appears in

                // Movie moments

                // Link to webpage

            }
        }.ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: PredatorService().apexPredators[2])
}
