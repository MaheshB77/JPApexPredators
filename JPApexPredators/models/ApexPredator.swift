//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 28/12/25.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String

    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    enum APType: String, Decodable {
        case land
        case air
        case sea

        var background: Color {
            switch self {
            case .land:
                .brown
            case .air:
                .blue
            case .sea:
                .green
            }
        }
    }

}

struct MovieScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
}

