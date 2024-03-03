//
//  ContentView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 26/02/24.
//

import SwiftUI

struct CardsContentView: View {
    
    @StateObject var viewModel: CardsViewModel = CardsViewModel()

    var body: some View {

        ZStack {
            Color.CustomColors.orange
                .ignoresSafeArea()

            if viewModel.ingridients.isEmpty {
                VStack {
                    Text("Ingredients are empty")
                }
            } else {
                ForEach(viewModel.ingridients.reversed()) { ingridient in
                    CardView(currentIngridient: ingridient)
                        .environmentObject(viewModel)
                }
            }
        }
    }

}

struct CardsContentView_Previews: PreviewProvider {
   static var previews: some View {
       CardsContentView(viewModel: CardsViewModel())
    }
}
