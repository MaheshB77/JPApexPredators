//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 28/12/25.
//

import SwiftUI

struct ContentView: View {
    let predatorService = PredatorService()

    @State var searchStr = ""

    var filteredPredators: [ApexPredator] {
        if searchStr.isEmpty {
            return predatorService.apexPredators
        } else {
            return predatorService.apexPredators.filter {
                predator in
                predator.name.lowercased().contains(searchStr.lowercased())
            }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredPredators) { predator in

                NavigationLink {

                } label: {
                    HStack {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)

                        VStack(alignment: .leading) {
                            Text(predator.name)
                                .font(.title3)

                            // Predator type chip
                            Text(predator.type.rawValue.capitalized)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(predator.type.background)

                                .clipShape(.capsule)

                        }
                    }
                }
                .navigationTitle("Apex Predators")
                .searchable(text: $searchStr, prompt: "Search Apex Predators")
                .autocorrectionDisabled()
                .animation(.default, value: searchStr)

            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
