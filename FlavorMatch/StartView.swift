//
//  ContentView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct StartView: View {
    
    private enum Constants {
        static let imageName: String = "hands"
        static let buttonTitle: String = "Match your flavour"
    }
    
    @State var viewModel: AppViewModel = AppViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.CustomColors.orange
                        .ignoresSafeArea()

                    Image(Constants.imageName)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                    
                    NavigationLink(destination: NavigationSelectionView(navigationIndex: 0,
                                                                        viewModel: viewModel)) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.clear)

                            Text(Constants.buttonTitle)
                                .font(.system(size: 50, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color.CustomColors.orange)
                                .padding(.top, -40)
                        }
                        .frame(width: 250, height: 300)
                        .padding()
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
   static var previews: some View {
       StartView()
    }
}
