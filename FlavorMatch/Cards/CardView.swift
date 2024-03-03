//
//  CardView.swift
//  FlavorMatch
//
//  Created by Svetlana Shardakova on 25/02/24.
//

import SwiftUI

struct CardView: View {

    @EnvironmentObject var viewModel: CardsViewModel
    var currentIngridient: IngridientModel
    
    // gestures
    @State var offset: CGFloat = 0
    @GestureState var isDragging: Bool = false
    @State var endSwipe: Bool = false
    
    var body: some View {
        
        GeometryReader { proxy in
            
//            let size = proxy.size
//            let index = CGFloat(viewModel.getIndex(ingridient: currentIngridient))
//            let topOffset = (index <= 2 ? index : 2) * 15
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
//                    .frame(width: size.width, height: size.height)
                    .foregroundColor(Color.CustomColors.lightOrange)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.vertical, 50)
                    .padding(.horizontal, 20)
                VStack {
                    Image(currentIngridient.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    Text(currentIngridient.name)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.CustomColors.green)
                        .padding(.bottom)
                }
            }
            
        }
        .offset(x: offset)
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
        .gesture(
            DragGesture()
                .updating($isDragging, body: { value, out, _ in
                    out = true
                })
                .onChanged({ value in
                    let translation = value.translation.width
                    offset = (isDragging ? translation : .zero)
                })
                .onEnded({ value in
                    let width: CGFloat = 500//getRect().width - 50
                    let translation = value.translation.width
                    
                    let checkingStatus = (translation > 0 ? translation : -translation )
                    
                    withAnimation {
                        if checkingStatus > (width / 2) {
                            offset = (translation > 0 ? width : -width ) * 2
                            endSwipeActions()
                        } else {
                            offset = .zero
                        }
                        
                    }
                })
        )

    }
    
    func endSwipeActions() {
        withAnimation(.none) {
            endSwipe = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let _ = viewModel.displayedIngridients?.first {
                    
                    let _ = withAnimation {
                        viewModel.displayedIngridients?.removeFirst()
                    }
                }
            }
        }
    }

}

struct CardView_Previews: PreviewProvider {
   static var previews: some View {
       CardView(currentIngridient: .init(name: "basil", description: "basil", imageName: "basel"))
           .environmentObject(CardsViewModel())
    }
}
