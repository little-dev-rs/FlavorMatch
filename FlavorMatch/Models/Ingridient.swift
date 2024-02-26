//
//  Ingridient.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 26/02/24.
//

import Foundation

struct Ingridient: Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let imageName: String
}

