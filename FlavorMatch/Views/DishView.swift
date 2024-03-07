//
//  DishView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import CoreMotion
import SwiftUI

struct DishView: View {
    
    private enum Constants {
        static let defaultDish: Dish = .riceNoodles
        static let actionText: String = "shake to change"
        static let foodText: String = "Food"
    }
    @State private var isNavigationActive = false
    private let motionManager = CMMotionManager()
    var viewModel: AppViewModel
    
    var body: some View {
//        NavigationStack {
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
                                    Text(viewModel.finalDish?.name ?? Constants.defaultDish.name)
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
                                    Text("\(viewModel.finalDish?.country ?? "") \(Constants.foodText)")
                                        .font(.system(size: 30, design: .rounded))
                                        .multilineTextAlignment(.leading)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.CustomColors.orange)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            Image(viewModel.finalDish?.image ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
//                            Text(Constants.actionText)
//                                .font(.system(size: 20, design: .rounded))
//                                .multilineTextAlignment(.leading)
//                                .foregroundStyle(Color.CustomColors.gray)
                        }
                        .padding()
                    }
            }
//            .navigationDestination(
//                isPresented:  $isNavigationActive) {
//                    CardPickerView(viewModel: viewModel.getRandom())
//                    Text("")
//                    .hidden()
//                }
//        }
    }
    
    private func startShakeDetection() {
         guard motionManager.isAccelerometerAvailable else { return }

         motionManager.startAccelerometerUpdates(to: OperationQueue.main) { data, _ in
             if let acceleration = data?.acceleration {
                 let threshold: Double = 1.5
                 let isShakingNow = abs(acceleration.x) > threshold || abs(acceleration.y) > threshold || abs(acceleration.z) > threshold

                 if isShakingNow {
                     isNavigationActive = true
                 }
             }
         }
     }
 
}

#Preview {
    DishView(viewModel: AppViewModel())
}
