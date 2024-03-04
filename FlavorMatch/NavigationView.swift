//
//  NavigationView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct NavigationSelectionView: View {

    @State var navigationIndex: Int
    
    var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Color.CustomColors.orange
                .ignoresSafeArea()
            
            VStack {
                if navigationIndex == 0 {
                    VStack {
                        ForEach(IsVeg.allCases, id: \.self) { option in
                            NavigationLink(destination: NavigationSelectionView(navigationIndex: 1, viewModel: viewModel.update(isVeg: option))) {
                                RoundedButton(text: option.name, color: Color.CustomColors.green)
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                else if (navigationIndex == 1) {
                    VStack {
                        ForEach(MainDish.allCases, id: \.self) { option in
                            NavigationLink(destination: NavigationSelectionView(navigationIndex: 2, viewModel: viewModel.update(mainDish: option))) {
                                RoundedButton(text: option.rawValue, color: Color.CustomColors.green)
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                else if (navigationIndex == 2) {
                    VStack {
                        switch viewModel.isVeg {
                        case .veg:
                            ForEach(Addings.vegCases, id: \.self) { option in
                                NavigationLink(destination: CardPickerView(viewModel: viewModel.update(addings: .veg(option)))) {
                                    RoundedButton(text: option.rawValue, color: Color.CustomColors.green)
                                }
                                .padding(.bottom, 50)
                            }
                        case .nonVeg, .none:
                            ForEach(Addings.nonVegCases, id: \.self) { option in
                                NavigationLink(destination: CardPickerView(viewModel: viewModel.update(addings: .nonVeg(option)))) {
                                    RoundedButton(text: option.rawValue, color: Color.CustomColors.green)
                                }
                                .padding(.bottom, 50)
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
        NavigationSelectionView(navigationIndex: 1, viewModel: AppViewModel())
    }

}
