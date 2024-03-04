//
//  CardPickerView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct CardPickerView: View {

    @StateObject var viewModel: AppViewModel

    @State var ingridientNumber: Int = 5
    
    var body: some View {
        if ingridientNumber == 0 {
            ZStack{
                Color.CustomColors.lightOrange
                    .ignoresSafeArea()
                NavigationLink(destination: DishView(dishes: viewModel.finalDish)) {
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
                
                ForEach(viewModel.allIngridients) { ingridient in
                    CardLike(currentIngridient: ingridient, ingridientNumber: $ingridientNumber) {
                        print("test1 like \(ingridient)")
                    }
                }
            }
        }
    }

}

#Preview {
    CardPickerView(viewModel: AppViewModel())
}
