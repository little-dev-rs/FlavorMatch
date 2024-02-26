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
        static let buttonTitle: String = "MATCH \nYOUR\n FLAVOUR"
    }

    var body: some View {

        NavigationView {
            VStack {
                ZStack {
                    Color.CustomColors.orange
                        .ignoresSafeArea()

                    Image(Constants.imageName)
                        .aspectRatio(contentMode: .fill)
                    
                    NavigationLink(destination: CardsContentView()) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.clear)

                            Text(Constants.buttonTitle)
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(Color.CustomColors.orange)
                                .padding(.top, -40)
                        }
                        .frame(width: 300, height: 300)
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
