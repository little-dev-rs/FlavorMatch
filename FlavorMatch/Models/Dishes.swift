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
    
    var image: String {
        switch self {
        case .byriani:
            return "biryani"
        case .paella:
            return "paellaMeat"
        case .guacamole:
            return "guacamole"
        case .falafel:
            return "falafel"
        case .burrito:
            return "vegBurrito"
        case .arroz:
            return "arrozConPollo"
        case .ricePapperRolls:
            return "veganRiceRolls"
        case .riceNoodles:
            return "riceNoodleSalad"
        case .bacalhauBras:
            return "bacalhauBras"
        case .risotto:
            return "mashroomRisotto"
        case .moussaka:
            return "mussaka"
        case .shepardsPie:
            return "shepardsPie"
        case .burek:
            return "burek"
        case .pasteisDeBacalhau:
            return "PasteisDeBacalhau"
        case .fishNChips:
            return "fishChips"
        case .patatasBravas:
            return "patatasBravas"
        case .potatoSalad:
            return "potatoSalad"
        case .gnocchi:
            return "gnocchi"
        case .empandas:
            return "empanadas"
        case .gyoza:
            return "gyoza"
        case .croqueMonsier:
            return "croqueMonsier"
        case .capreseSalad:
            return "caprese"
        case .greekSalad:
            return "greekSalad"
        case .padThai:
            return "padThai"
        }
    }
    
    var name: String {
        switch self {
        case .byriani:
            return "Byriani"
        case .paella:
            return "Paella"
        case .guacamole:
            return "Guacamole"
        case .falafel:
            return "Falafel"
        case .burrito:
            return "Veg Burrito"
        case .arroz:
            return "Arroz con pollo"
        case .ricePapperRolls:
            return "Rice paper rolls"
        case .riceNoodles:
            return "Vegan Rice Noodle Salad"
        case .bacalhauBras:
            return "Bacalhau à Brás"
        case .risotto:
            return "Mashroom Risotto"
        case .moussaka:
            return "Moussaka"
        case .shepardsPie:
            return "Shepards Pie"
        case .burek:
            return "Burek"
        case .pasteisDeBacalhau:
            return "Pastéis de bacalhau"
        case .fishNChips:
            return "Fish and chips"
        case .patatasBravas:
            return "Patatas Bravas"
        case .potatoSalad:
            return "Potato Salad"
        case .gnocchi:
            return "Gnocchi"
        case .empandas:
            return "Empandas"
        case .gyoza:
            return "Gyoza"
        case .croqueMonsier:
            return "Croque Monsier"
        case .capreseSalad:
            return "Caprese Salad"
        case .greekSalad:
            return "Greek Salad"
        case .padThai:
            return "Pad thai"
        }
    }
}
