//
//  DishView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct DishView: View {
    var dishes: [String]
    var body: some View {
        VStack{
            ForEach(dishes, id: \.self) { dish in
                Text(dish)
            }
        }
    }
}

#Preview {
    DishView(dishes: ["No dish yet", "No second of course"])
}
