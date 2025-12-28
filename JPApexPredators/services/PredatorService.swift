//
//  PredatorService.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 28/12/25.
//

import Foundation

class PredatorService {
    var apexPredators: [ApexPredator] = []

    init() {
        decodePredators()
    }

    func decodePredators() {
        if let url = Bundle.main.url(
            forResource: "jpapexpredators",
            withExtension: "json"
        ) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode(
                    [ApexPredator].self,
                    from: data
                )
            } catch {
                print("Error while decoding the JSON: \(error)")
            }
        }
    }

    func search(searchStr: String) -> [ApexPredator] {
        if searchStr.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter {
                predator in
                predator.name.lowercased().contains(searchStr.lowercased())
            }
        }
    }

    func sort(alphabatically: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabatically {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }

    }
}
