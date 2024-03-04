//
//  RoundedButton.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 03/03/24.
//

import SwiftUI

struct RoundedButton: View {
    var text: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(text)
            .font(.system(size: 60, design: .rounded))
            .fontWeight(.bold)
            .frame(width: 278, height: 100)
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}
