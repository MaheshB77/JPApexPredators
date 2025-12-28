//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Mahesh Bansode on 28/12/25.
//

import SwiftUI

struct ContentView: View {
    let predatorService = PredatorService()

    var body: some View {
        List(predatorService.apexPredators) { predator in
            
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
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
