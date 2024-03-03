//
//  Test.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 26/02/24.
//

import SwiftUI

class CardsViewModel: ObservableObject {
    
    @Published var ingridients: [IngridientModel]
    @Published var displayedIngridients: [IngridientModel]?
    
    public init() {
        self.ingridients = [
            /*
            Ingridient(name: "almonds", description: "almonds", imageName: "almonds"),
            Ingridient(name: "potato", description: "potato", imageName: "potato"),
            Ingridient(name: "basel", description: "basel", imageName: "basel"),
            Ingridient(name: "cheese", description: "cheese", imageName: "cheese"),
            Ingridient(name: "brinjal", description: "brinjal", imageName: "brinjal"),
            Ingridient(name: "rice", description: "rice", imageName: "rice"),*/
            IngridientModel(name: "carrot", description: "carrot", imageName: "carrot"),
            IngridientModel(name: "onions", description: "onions", imageName: "onions"),
            IngridientModel(name: "tomato", description: "tomato", imageName: "tomato"),
            IngridientModel(name: "garlic", description: "garlic", imageName: "garlic"),
            IngridientModel(name: "pepers", description: "pepers", imageName: "pepers"),
        ]
        self.displayedIngridients = ingridients
    }
    
    public func getIndex(ingridient: IngridientModel) -> Int {
        let index = displayedIngridients?.firstIndex(where: { currentIngridient in
            return ingridient.id == currentIngridient.id
        }) ?? 0
        return index
    }
}
