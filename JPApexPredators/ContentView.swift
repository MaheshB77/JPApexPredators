//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 28/12/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let predatorService = PredatorService()

    @State var searchStr = ""
    @State var alpahabeticSort = false
    @State var selectedType: APType = .all

    var filteredPredators: [ApexPredator] {
        predatorService.filter(type: selectedType)
        predatorService.sort(alphabatically: alpahabeticSort)
        return predatorService.search(searchStr: searchStr)
    }

    var body: some View {
        NavigationStack {
            List(filteredPredators) { predator in

                NavigationLink {
                    PredatorDetail(
                        predator: predator,
                        position: .camera(
                            MapCamera(
                                centerCoordinate: predator.location,
                                distance: 30000
                            )
                        )
                    )
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
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchStr, prompt: "Search Apex Predators")
            .autocorrectionDisabled()
            .animation(.default, value: searchStr)
            .animation(.default, value: selectedType)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alpahabeticSort.toggle()
                        }
                    } label: {
                        Image(
                            systemName: alpahabeticSort ? "film" : "textformat"
                        )
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Menu {

                        Picker("Filter", selection: $selectedType) {
                            ForEach(APType.allCases) { type in
                                Label(
                                    type.rawValue.capitalized,
                                    systemImage: type.icon
                                )
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
