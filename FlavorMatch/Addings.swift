//
//  Addings.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 03/03/24.
//

import UIKit

enum Addings {

    enum Veg {
        case vegan
        case diary
        case other
    }

    enum NonVeg {
        case meat
        case fish
        case other
    }
    
    case veg(Veg)
    case nonVeg(NonVeg)

}

enum MainDish {
    case rice
    case potato
    case other
}

enum Ingridient {
    case tomato
    case chili
    case garlic
    case onion
    case carrot
    // a здесь смапать с ингридиентами
    var image: UIImage {
        switch self {
        case .tomato:
            return UIImage(named: "") ?? UIImage()
        case .chili:
            return UIImage(named: "") ?? UIImage()
        case .garlic:
            return UIImage(named: "") ?? UIImage()
        case .onion:
            return UIImage(named: "") ?? UIImage()
        case .carrot:
            return UIImage(named: "") ?? UIImage()
        }
    }
}
