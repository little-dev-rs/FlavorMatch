//
//  CardPickerView.swift
//  FlavorMatch
//
//  Created by Fausto Pinto Cabrera on 01/03/24.
//

import SwiftUI

struct CardPickerView: View {
    @State var ingridientList: ingridientList
    @StateObject var viewModel: CardsViewModel = CardsViewModel()
    @State var ingridientOptions: [Ingridient] = []
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CardPickerView(ingridientList:ingridientList(
            isVegan: false,
            base: "",
            complement: "",
            ingridients: []
        )
    )
}
