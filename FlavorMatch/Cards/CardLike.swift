//
//  CardPickerView.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 04/03/24.
//

import SwiftUI

struct CardLike: View {
    
    var currentIngridient: Ingridient
    var onLikeIngridient: () -> Void
    var onDislikeIngridient: () -> Void
    
    var body: some View {
        VStack {
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
                        .font(.system(size: 50, design: .rounded))
                        .fontWeight(.bold)
                        .bold()
                        .foregroundStyle(Color.CustomColors.green)
                        .padding(.bottom)
                }
            }
            HStack {
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
            .padding(.bottom, 40)
        }
    }
    
    func likedIngridient() {
        onLikeIngridient()
    }
    
    func dislikedIngridient() {
        onDislikeIngridient()
    }
}


#Preview {
    CardLike(currentIngridient: Ingridient.carrot) {
        print("like")
    } onDislikeIngridient: {
        print("dislike")
    }

}

