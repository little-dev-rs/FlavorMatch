//
//  Addings.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 03/03/24.
//

import Foundation

enum Addings: Identifiable {

    enum Veg: String, Identifiable {
        case vegan
        case diary
        case other
        
        var id: UUID {
            UUID()
        }
    }

    enum NonVeg: String, Identifiable {
        case meat
        case fish
        case other
        
        var id: UUID {
            UUID()
        }
    }
    
    case veg(Veg)
    case nonVeg(NonVeg)

    var id: UUID {
        UUID()
    }
    
    static var nonVegCases: [NonVeg] = [.meat, .fish, .other]
    static var vegCases: [Veg] = [.vegan, .diary, .other]
}
