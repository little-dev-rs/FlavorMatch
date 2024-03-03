//
//  NavigationView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

class AppViewModel {

    var isVeg: Bool?
    var mainDish: MainDish?
    var addings: Addings?
//    let targetIngredients: [Ingridient] = [.onion, .tomato, .chili]
    var targetIngredients: [Ingridient]? {
        didSet {
            _ = setFinalDish()
        }
    }

    var finalDish: Dishes?



}

extension AppViewModel {
    
    func setFinalDish() -> Dishes? {
        guard let isVeg = isVeg else {
            return nil
        }
        if isVeg {
            return getVegOptions()
        } else {
            return getNonvegOptions()
        }
    }
    
    //TODO: handle all cases
    func getVegOptions() -> Dishes? {
        return .riceNoodles
    }

    func getNonvegOptions() -> Dishes? {
        guard let mainDish = mainDish, let addings = addings else { return nil}
    
        switch mainDish {
        case .rice:
            switch addings {
            case .veg(_):
                return nil
            case .nonVeg(let nonVegOption):
                switch nonVegOption {
                    // rice fish
                case .fish:
                    let preset: [Dishes] = [.bacalhauBras, .paella, .ricePapperRolls]
                    return matchDish(preset: preset)
                    
                    // rice meat
                case .meat:
                    let preset: [Dishes] = [.byriani, .paella, .arroz]
                    return matchDish(preset: preset)
                    
                    // rice other
                case .other:
                    let preset: [Dishes] = [.risotto, .ricePapperRolls]
                    return matchDish(preset: preset)
                }
            }
            
        case .potato:
            switch addings {
            case .veg(let veg):
                return nil
            case .nonVeg(let nonVeg):
                switch nonVeg {
                    // potato fish
                case .fish:
                    let preset: [Dishes] = [.pasteisDeBacalhau, .fishNChips]
                    return matchDish(preset: preset)
                    
                    // potato meat
                case .meat:
                    let preset: [Dishes] = [.moussaka, .shepardsPie, .burek]
                    return matchDish(preset: preset)
                    
                    // potato other
                case .other:
                    let preset: [Dishes] = [.potatoSalad, .patatasBravas, .gnocchi]
                    return matchDish(preset: preset)
                }
            }
        case .other:
            switch addings {
            case .veg(let veg):
                return nil
            case .nonVeg(let nonVeg):
                switch nonVeg {
                    // other fish
                case .fish:
                    return .fishNChips
                    
                    // other meat
                case .meat:
                    let preset: [Dishes] = [.empandas, .gyoza, .croqueMonsier]
                    return matchDish(preset: preset)
                    
                    // other other
                case .other:
                    let preset: [Dishes] = [.capreseSalad, .greekSalad, .padThai]
                    return matchDish(preset: preset)
                }
            }
        }
    }

    func matchDish(preset: [Dishes]) -> Dishes? {
        let matchingDishes = preset.filter { dish in
            guard let ingridients = dish.ingridientsToMatch, let choosenIngridients = targetIngredients else {
                return false
            }
            return Set(ingridients) == Set(choosenIngridients)
        }
        return matchingDishes.first
    }

}




struct NavigationSelectionView: View {

    @State var ingridientList: IngridientsList
    @State var navigationIndex: Int
    
    var body: some View {
        ZStack {
            Color.CustomColors.orange
                .ignoresSafeArea()
            VStack {
                if navigationIndex == 0 {
                    VStack {
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: true, base: ingridientList.base, complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 1)){
                            RoundedButton(text: "veg", color: Color.CustomColors.green)
                        }
                        .padding(.bottom,50)
                        
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: false, base: ingridientList.base, complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 1)){
                            RoundedButton(text: "non veg", color: Color.CustomColors.green)
                        }
                    }
                }
                else if (navigationIndex == 1) {
                    VStack {
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: "rice", complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 2)){
                            RoundedButton(text: "rice", color: Color.CustomColors.lightYellow)
                        }
                        .padding(.bottom,50)
                        
                        NavigationLink(destination:
                                        NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: "potato", complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 2)) {
                            RoundedButton(text: "potato", color: Color.CustomColors.lightYellow)
                        }
                        .padding(.bottom,50)
                        
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: "other", complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 2)){
                            RoundedButton(text: "other", color: Color.CustomColors.lightYellow)
                        }
                    }
                }
                else if (navigationIndex == 2) {
                    VStack {
                        if ingridientList.isVegan{
                            VStack {
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "vegan", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "vegan", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "dairy", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "dairy", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "other", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "other", color: Color.CustomColors.lightBlue)
                                }
                            }
                        }
                        else {
                            VStack {
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "meat", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "meat", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "fish", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "fish", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "other", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "other", color: Color.CustomColors.lightBlue)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct NavigationSelectionView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationSelectionView(
            ingridientList: IngridientsList(
                isVegan: false,
                base: "",
                complement: "",
                likedIngridients: [],
                dislikedIngridients: []
            ),
            navigationIndex: 0
        )
    }

}
