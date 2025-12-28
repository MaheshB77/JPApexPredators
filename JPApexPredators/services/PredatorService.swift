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
}
