//
//  Dishes.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 03/03/24.
//

import UIKit

enum Dishes { //rename to Dish
    case byriani
    case paella
    case guacamole
    case falafel
    case burrito
    case arroz
    case ricePapperRolls
    case riceNoodles
    case bacalhauBras //
    case risotto
    case moussaka
    case shepardsPie
    case burek
    case pasteisDeBacalhau //
    case fishNChips
    case patatasBravas
    case potatoSalad
    case gnocchi
    case empandas
    case gyoza
    case croqueMonsier
    case capreseSalad
    case greekSalad
    case padThai
    
    static var allCases: [Dishes] {
        return [
            .byriani, .paella, .guacamole, .falafel, .burrito, .arroz , .ricePapperRolls, .riceNoodles, .bacalhauBras, .risotto, .moussaka, .shepardsPie, .burek, .pasteisDeBacalhau, .fishNChips , .patatasBravas, .potatoSalad , .gnocchi, .empandas, .gyoza, .croqueMonsier, .capreseSalad, .greekSalad, .padThai
        ]
    }
    // mb здесь прям смапать с обтектами
    
    var ingridientsToMatch: [Ingridient]? {
        switch self {
        case .byriani:
            return [.onion, .tomato, .chili, .garlic]
        case .paella:
            return [.carrot, .onion, .tomato, .garlic]
        case .guacamole:
            return [.onion, .tomato, .garlic]
        case .falafel:
            return [.onion, .garlic, .chili]
        case .burrito:
            return [.onion, .tomato, .carrot]
        case .arroz:
            return [.carrot, .onion, .chili]
        case .ricePapperRolls:
            return [.onion, .carrot]//
        case .riceNoodles:
            return [.onion, .carrot]
        case .bacalhauBras:
            return [.onion, .garlic]
        case .risotto:
            return [.garlic, .tomato]
        case .moussaka:
            return [.onion, .garlic, .tomato]
        case .shepardsPie:
            return [.onion, .garlic, .tomato, .carrot, .chili]
        case .burek:
            return [.onion, .garlic, .tomato]
        case .pasteisDeBacalhau:
            return [.onion, .garlic]
        case .fishNChips:
            return [.carrot, .chili]
        case .patatasBravas:
            return [.onion, .garlic, .tomato, .chili]
        case .potatoSalad:
            return [.garlic]
        case .gnocchi:
            return [.onion, .garlic, .tomato]
        case .empandas:
            return [.garlic, .tomato, .chili]
        case .gyoza:
            return [.onion, .garlic]
        case .croqueMonsier:
            return [.tomato]
        case .capreseSalad:
            return [.tomato]
        case .greekSalad:
            return [.onion, .garlic, .tomato]
        case .padThai:
            return [.onion, .carrot, .chili]
        }
    }
    
    var image: UIImage {
        switch self {
        case .byriani:
            return UIImage(named: "") ?? UIImage()
        case .paella:
            return UIImage(named: "") ?? UIImage()
        case .guacamole:
            return UIImage(named: "") ?? UIImage()
        case .falafel:
            return UIImage(named: "") ?? UIImage()
        case .burrito:
            return UIImage(named: "") ?? UIImage()
        case .arroz:
            return UIImage(named: "") ?? UIImage()
        case .ricePapperRolls:
            return UIImage(named: "") ?? UIImage()
        case .riceNoodles:
            return UIImage(named: "") ?? UIImage()
        case .bacalhauBras:
            return UIImage(named: "") ?? UIImage()
        case .risotto:
            return UIImage(named: "") ?? UIImage()
        case .moussaka:
            return UIImage(named: "") ?? UIImage()
        case .shepardsPie:
            return UIImage(named: "") ?? UIImage()
        case .burek:
            return UIImage(named: "") ?? UIImage()
        case .pasteisDeBacalhau:
            return UIImage(named: "") ?? UIImage()
        case .fishNChips:
            return UIImage(named: "") ?? UIImage()
        case .patatasBravas:
            return UIImage(named: "") ?? UIImage()
        case .potatoSalad:
            return UIImage(named: "") ?? UIImage()
        case .gnocchi:
            return UIImage(named: "") ?? UIImage()
        case .empandas:
            return UIImage(named: "") ?? UIImage()
        case .gyoza:
            return UIImage(named: "") ?? UIImage()
        case .croqueMonsier:
            return UIImage(named: "") ?? UIImage()
        case .capreseSalad:
            return UIImage(named: "") ?? UIImage()
        case .greekSalad:
            return UIImage(named: "") ?? UIImage()
        case .padThai:
            return UIImage(named: "") ?? UIImage()
        }
    }
    
    var name: String {
        switch self {
        case .byriani:
            return "byriani"
        case .paella:
            return ""
        case .guacamole:
            return ""
        case .falafel:
            return ""
        case .burrito:
            return ""
        case .arroz:
            return ""
        case .ricePapperRolls:
            return ""
        case .riceNoodles:
            return ""
        case .bacalhauBras:
            return ""
        case .risotto:
            return ""
        case .moussaka:
            return ""
        case .shepardsPie:
            return ""
        case .burek:
            return ""
        case .pasteisDeBacalhau:
            return ""
        case .fishNChips:
            return ""
        case .patatasBravas:
            return ""
        case .potatoSalad:
            return ""
        case .gnocchi:
            return ""
        case .empandas:
            return ""
        case .gyoza:
            return ""
        case .croqueMonsier:
            return ""
        case .capreseSalad:
            return ""
        case .greekSalad:
            return ""
        case .padThai:
            return ""
        }
    }
}
