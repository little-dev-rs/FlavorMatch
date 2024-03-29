//
//  AppViewModel.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 04/03/24.
//

import Foundation

class AppViewModel: ObservableObject {

    var isVeg: IsVeg?
    var mainDish: MainDish?
    var addings: Addings?
    var targetIngredients: [Ingridient]? = [] {
        didSet {
            finalDish = getDishOption()
        }
    }

    var allIngridients: [Ingridient] = Ingridient.allCases

    var finalDish: Dish?
    
    func update(isVeg: IsVeg? = nil, mainDish: MainDish? = nil, addings: Addings? = nil, addIngridient: Ingridient? = nil) -> AppViewModel {
        if let isVeg = isVeg {
            self.isVeg = isVeg
        }
        if let mainDish = mainDish {
            self.mainDish = mainDish
        }
        if let addings = addings {
            self.addings = addings
        }
        if let ingridient = addIngridient {
            self.targetIngredients?.append(ingridient)
        }
        return self
    }
    
    func getRandom() -> AppViewModel {
//        Dish.allCases.randomElement()
        update(addIngridient: targetIngredients?.randomElement())
    }
}

enum IsVeg: Identifiable {
    
    case veg
    case nonVeg
    
    var id: UUID {
        UUID()
    }
    
    var name: String {
        switch self {
        case .veg:
            return "veg"
        case .nonVeg:
            return "non Veg"
        }
    }
    
    static var allCases: [IsVeg] {
        [.veg, .nonVeg]
    }

}

extension AppViewModel {

    func getDishOption() -> Dish? {
        guard let mainDish = mainDish, let addings = addings else { return nil}
    
        switch mainDish {
        case .rice:
            switch addings {
            case .veg(let vegOption):
                switch vegOption {
                case .vegan:
                    // rice vegan
                    let preset: [Dish] = [.ricePapperRolls] // TODO :
                    return matchDish(preset: preset)
                case .diary:
                    // rice diary
                    let preset: [Dish] = [.fishNChips] // TODO:
                    return matchDish(preset: preset)
                case .other:
                    // rice other
                    let preset: [Dish] = [.falafel, .burrito, .guacamole] // TODO:
                    return matchDish(preset: preset)
                }
            case .nonVeg(let nonVegOption):
                switch nonVegOption {
                    // rice fish
                case .fish:
                    let preset: [Dish] = [.bacalhauBras, .paella, .ricePapperRolls]
                    return matchDish(preset: preset)
                    
                    // rice meat
                case .meat:
                    let preset: [Dish] = [.byriani, .paella, .arroz]
                    return matchDish(preset: preset)
                    
                    // rice other
                case .other:
                    let preset: [Dish] = [.risotto, .ricePapperRolls]
                    return matchDish(preset: preset)
                }
            }
        case .potato:
            switch addings {
            case .veg(let veg):
                switch veg {
                    
                case .vegan:
                    // potato vegan
                    let preset: [Dish] = [.patatasBravas] // TODO:
                    return matchDish(preset: preset)
                case .diary:
                    // potato diary
                    let preset: [Dish] = [.potatoSalad] // TODO:
                    return matchDish(preset: preset)
                case .other:
                    // potato other
                    let preset: [Dish] = [.patatasBravas] // TODO:
                    return matchDish(preset: preset)
                }
            case .nonVeg(let nonVeg):
                switch nonVeg {
                    // potato fish
                case .fish:
                    let preset: [Dish] = [.pasteisDeBacalhau, .fishNChips]
                    return matchDish(preset: preset)
                    
                    // potato meat
                case .meat:
                    let preset: [Dish] = [.moussaka, .shepardsPie, .burek]
                    return matchDish(preset: preset)
                    
                    // potato other
                case .other:
                    let preset: [Dish] = [.potatoSalad, .patatasBravas, .gnocchi]
                    return matchDish(preset: preset)
                }
            }
        case .other:
            switch addings {
            case .veg(let vegOption):
                switch vegOption {
                case .vegan:
                    // other vegan
                    let preset: [Dish] = [ .ricePapperRolls]  // TODO :
                    return matchDish(preset: preset)
                case .diary:
                    // other diary
                    let preset: [Dish] = [.riceNoodles]  // TODO :
                    return matchDish(preset: preset)
                case .other:
                    // other other
                    let preset: [Dish] = [.falafel] // TODO :
                    return matchDish(preset: preset)
                }
            case .nonVeg(let nonVeg):
                switch nonVeg {
                    // other fish
                case .fish:
                    return .fishNChips // TODO:
                    
                    // other meat
                case .meat:
                    let preset: [Dish] = [.empandas, .gyoza, .croqueMonsier]
                    return matchDish(preset: preset)
                    
                    // other other
                case .other:
                    let preset: [Dish] = [.capreseSalad, .greekSalad, .padThai]
                    return matchDish(preset: preset)
                }
            }
        }
    }

    func matchDish(preset: [Dish]) -> Dish? {
        var finalDish = preset.randomElement()
        preset.forEach { dish in
            if Set(arrayLiteral: dish.ingridientsToMatch) == Set(arrayLiteral: targetIngredients) {
                finalDish = dish
            }
        }
        return finalDish
    }

}
