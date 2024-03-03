//
//  Ingridient.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 26/02/24.
//

import Foundation

struct IngridientModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let imageName: String
}

