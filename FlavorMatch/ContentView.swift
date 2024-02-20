//
//  ContentView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("doodle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .position(.init(x: UIScreen.main.bounds.width / 2, y:  UIScreen.main.bounds.height / 2))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
