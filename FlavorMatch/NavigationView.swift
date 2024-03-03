//
//  NavigationView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct NavigationSelectionView: View {
    @State var ingridientList: IngridientsList
    @State var navigationIndex: Int
    
    var body: some View {
        ZStack {
            Color.CustomColors.orange
                .ignoresSafeArea()
            VStack {
                if navigationIndex == 0 {
                    VStack {
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: true, base: ingridientList.base, complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 1)){
                            RoundedButton(text: "veg", color: Color.CustomColors.green)
                        }
                        .padding(.bottom,50)
                        
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: false, base: ingridientList.base, complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 1)){
                            RoundedButton(text: "non veg", color: Color.CustomColors.green)
                        }
                    }
                }
                else if (navigationIndex == 1) {
                    VStack {
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: "rice", complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 2)){
                            RoundedButton(text: "rice", color: Color.CustomColors.lightYellow)
                        }
                        .padding(.bottom,50)
                        
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: "potato", complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 2)){
                            RoundedButton(text: "potato", color: Color.CustomColors.lightYellow)
                        }
                        .padding(.bottom,50)
                        
                        NavigationLink(destination: NavigationSelectionView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: "other", complement: ingridientList.complement, likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients), navigationIndex: 2)){
                            RoundedButton(text: "other", color: Color.CustomColors.lightYellow)
                        }
                    }
                }
                else if (navigationIndex == 2) {
                    VStack {
                        if ingridientList.isVegan{
                            VStack {
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "vegan", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "vegan", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "dairy", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "dairy", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "other", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "other", color: Color.CustomColors.lightBlue)
                                }
                            }
                        }
                        else {
                            VStack {
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "meat", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "meat", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "fish", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "fish", color: Color.CustomColors.lightBlue)
                                }
                                .padding(.bottom,50)
                                
                                NavigationLink(destination: CardPickerView(ingridientList: FlavorMatch.IngridientsList(isVegan: ingridientList.isVegan, base: ingridientList.base, complement: "other", likedIngridients: ingridientList.likedIngridients, dislikedIngridients: ingridientList.dislikedIngridients))){
                                    RoundedButton(text: "other", color: Color.CustomColors.lightBlue)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct NavigationSelectionView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationSelectionView(
            ingridientList: IngridientsList(
                isVegan: false,
                base: "",
                complement: "",
                likedIngridients: [],
                dislikedIngridients: []
            ),
            navigationIndex: 0
        )
    }

}
