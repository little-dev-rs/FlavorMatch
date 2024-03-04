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
        
        ZStack {
            Color.CustomColors.orange
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 60)
                .foregroundStyle(Color.CustomColors.lightOrange)
                .padding()
                .overlay {
                    VStack {
                        VStack {
                            HStack {
                                Text(dishes?.name ?? "Dish")
                                    .font(.system(size: 50, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.CustomColors.orange)
                                Spacer()
                            }

                            Capsule(style: .circular)
                                .foregroundStyle(Color.CustomColors.orange)
                                .frame(height: 5)
                            HStack {
                                Text("Country food")
                                    .font(.system(size: 30, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.CustomColors.orange)
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 20)

                        Image(dishes?.image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("shake to change")
                            .font(.system(size: 20, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.gray) //
                    }
                    .padding()
                }
            
//            VStack {
//                VStack {
//                    Text(dishes?.name ?? "Dish")
//                        .font(.system(size: 60, design: .rounded))
//                        .multilineTextAlignment(.leading)
//                        .fontWeight(.bold)
//                        .foregroundStyle(Color.CustomColors.orange)
//     
//                    
//                    Capsule(style: .circular)
//                        .foregroundStyle(Color.CustomColors.orange)
//                        .frame(height: 5)
//                    
//                    Text("Country food")
//                        .font(.system(size: 30, design: .rounded))
//                        .multilineTextAlignment(.leading)
//                        .fontWeight(.bold)
//                        .foregroundStyle(Color.CustomColors.orange)
//                }
//                .padding(.horizontal, 20)
//
//                Image(dishes?.image ?? "")
//                
//                Text("shake to change")
//                    .font(.system(size: 20, design: .rounded))
//                    .multilineTextAlignment(.leading)
//                    .foregroundStyle(Color.gray) //
//            }
//            .padding()
        }
    }
}

#Preview {
    DishView(dishes: .arroz)
}
