//
//  Ingridient.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 04/03/24.
//

import Foundation

enum Ingridient: String, Identifiable {
    
    var id: UUID {
        return  UUID()
    }

    case tomato
    case chili
    case garlic
    case onion
    case carrot

    var imageName: String {
        switch self {
        case .tomato:
            return "tomato"
        case .chili:
            return "pepers"
        case .garlic:
            return "almonds" // garlic
        case .onion:
            return "onions"
        case .carrot:
            return "gyoza" // carrot
        }
    }
    
    static var allCases: [Ingridient] = [.carrot, .chili, .garlic, .onion, .tomato]
}

