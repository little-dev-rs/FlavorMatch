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
    
    var body: some View {

        Text(text)
            .font(.system(size: 50))
            .frame(width: 278, height: 100)
            .foregroundStyle(.white)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 22))
    }

}
