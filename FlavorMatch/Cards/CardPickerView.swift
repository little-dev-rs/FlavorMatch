//
//  CardPickerView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct CardPickerView: View {

    @StateObject var viewModel: AppViewModel
    @State var ingridientNumber: Int = 5 //
    
    var body: some View {
        if ingridientNumber == 0 {
            ZStack{
                Color.CustomColors.lightOrange
                    .ignoresSafeArea()
                NavigationLink(destination: DishView(viewModel: viewModel)) {
                    VStack{
                        Image("burningpot")
                        Text("Matched !")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.CustomColors.orange)
                    }
                }
            }
        } else {
            ZStack{
                Color.CustomColors.orange
                    .ignoresSafeArea()
                
                CardLike(currentIngridient: viewModel.allIngridients[ingridientNumber - 1]) {
                    ingridientNumber -= 1
                    _ = viewModel.update(addIngridient: viewModel.allIngridients[ingridientNumber])
                } onDislikeIngridient: {
                    ingridientNumber -= 1
                }
            }
        }
    }

}

#Preview {
    CardPickerView(viewModel: AppViewModel())
}
