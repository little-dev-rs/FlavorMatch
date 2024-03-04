//
//  RoundedButton.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 03/03/24.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var color: Color
//    var onButtonTap: (() -> Void)?

    var body: some View {
//        Button(action: {
//            onButtonTap?()
//        }) {
            Text(text)
                .font(.system(size: 50))
                .frame(width: 278, height: 100)
                .foregroundStyle(.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 22))
//        }
    }
}

//struct RoundedButton: View {
//    
//    var text: String
//    var color: Color
//    
//    var body: some View {
//
//        Text(text)
//            .font(.system(size: 50))
//            .frame(width: 278, height: 100)
//            .foregroundStyle(.white)
//            .background(color)
//            .clipShape(RoundedRectangle(cornerRadius: 22))
//    }
//
//}

//struct RoundedButton: View {
//    var text: String
//    var color: Color
//    var onButtonTap: (() -> Void)?
//    
//    var body: some View {
//
//        Text(text)
//            .font(.system(size: 50))
//            .frame(width: 278, height: 100)
//            .foregroundStyle(.white)
//            .background(color)
//            .clipShape(RoundedRectangle(cornerRadius: 22))
//            .onTapGesture {
//                onButtonTap?()
//            }
//    }
//
//}


//struct RoundedButton: View {
//
//    var text: String
//    var color: Color
//    var onButtonTap: () -> Void
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 22)
//            Text(text)
//                .font(.system(size: 50))
//                .frame(width: 278, height: 100)
//                .foregroundStyle(.white)
//                .background(color)
//        }
//        .onTapGesture {
//            onButtonTap()
//        }
//    }
//}
