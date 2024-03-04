//
//  CardPickerView.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 04/03/24.
//

import SwiftUI

struct CardLike: View {
    
    var currentIngridient: Ingridient

    @State var display: Bool = true
    @Binding var ingridientNumber: Int
    
    var onLikeIngridient: () -> Void

    var body: some View {
        if display{
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(Color.CustomColors.lightOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.vertical, 50)
                        .padding(.horizontal, 20)
                    VStack {
                        Image(currentIngridient.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                        Text(currentIngridient.rawValue)
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.CustomColors.green)
                            .padding(.bottom)
                    }
                }
                HStack{
                    Spacer()
                    Button(action: {
                        likedIngridient()
                    }, label: {
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .padding()
                            .background(Color.CustomColors.lightOrange)
                            .foregroundStyle(Color.CustomColors.orange)
                            .frame(width: 91.2, height: 91.2)
                            .clipShape(Circle())
                    })
                    Spacer()
                    Button(action: {
                        dislikedIngridient()
                    }, label: {
                        Image(systemName: "hand.thumbsdown.fill")
                            .resizable()
                            .padding()
                            .background(Color.CustomColors.lightOrange)
                            .foregroundStyle(Color.CustomColors.orange)
                            .frame(width: 91.2, height: 91.2)
                            .clipShape(Circle())
                    })
                    Spacer()
                }
            }
        }
    }
    
    func likedIngridient() {
        onLikeIngridient()
        ingridientNumber -= 1
        self.display = false
    }
    
    func dislikedIngridient() {
        ingridientNumber -= 1
        self.display = false
    }
}

