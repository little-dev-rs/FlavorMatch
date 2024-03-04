//
//  DishView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct DishView: View {
    var dishes: Dishes?
    var body: some View {
        
        VStack {
            Text(dishes?.name ?? "dishes?.name ")
//            ForEach(dishes, id: \.self) { dish in
//                Text(dish)
//            }
        }
    }
}

//#Preview {
//    DishView(dishes: ["No dish yet", "No second of course"])
//}
