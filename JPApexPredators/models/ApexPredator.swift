//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 28/12/25.
//

struct ApexPredator: Decodable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenses: [MovieScene]
    let link: String
}

struct MovieScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
