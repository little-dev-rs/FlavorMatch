//
//  MainDish.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 04/03/24.
//

import Foundation

enum MainDish: String, Identifiable {
    case rice
    case potato
    case other
    
    var id: UUID {
        return  UUID()
    }

    static var allCases: [MainDish] = [.rice, .potato, .other]
}
