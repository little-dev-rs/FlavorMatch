//
//  Test.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 26/02/24.
//

import SwiftUI

class CardsViewModel: ObservableObject {
    
    @Published var ingridients: [Ingridient]
    @Published var displayedIngridients: [Ingridient]?
    
    public init() {
        self.ingridients = [
            /*
            Ingridient(name: "almonds", description: "almonds", imageName: "almonds"),
            Ingridient(name: "potato", description: "potato", imageName: "potato"),
            Ingridient(name: "basel", description: "basel", imageName: "basel"),
            Ingridient(name: "cheese", description: "cheese", imageName: "cheese"),
            Ingridient(name: "brinjal", description: "brinjal", imageName: "brinjal"),
            Ingridient(name: "rice", description: "rice", imageName: "rice"),*/
            Ingridient(name: "carrot", description: "carrot", imageName: "carrot"),
            Ingridient(name: "onions", description: "onions", imageName: "onions"),
            Ingridient(name: "tomato", description: "tomato", imageName: "tomato"),
            Ingridient(name: "garlic", description: "garlic", imageName: "garlic"),
            Ingridient(name: "pepers", description: "pepers", imageName: "pepers"),
        ]
        self.displayedIngridients = ingridients
    }
    
    public func getIndex(ingridient: Ingridient) -> Int {
        let index = displayedIngridients?.firstIndex(where: { currentIngridient in
            return ingridient.id == currentIngridient.id
        }) ?? 0
        return index
    }
}
