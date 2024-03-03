//
//  CardPickerView.swift
//  FlavorMatch
//
//  Created by PotatoDolphins on 20/02/24.
//

import SwiftUI

let DishesMockUp: [Dish] = [
    Dish(name: "BYRIANI - INDIA",  base: "rice", complement: "meat",
         ingridients: ["onions","tomato","garlic","pepers"]),
    Dish(name: "PAELLA",  base: "rice", complement: "meat",
         ingridients: ["carrot","onions","tomato",]),
    Dish(name: "Arroz con pollo",  base: "rice", complement: "meat",
         ingridients: ["carrot","onions","pepers"]),
    Dish(name: "Bacalhau à Brás",  base: "rice", complement: "fish",
         ingridients: ["onions","garlic"]),
    Dish(name: "Paella",  base: "rice", complement: "fish",
         ingridients: ["carrot","onions","tomato","garlic"]),
    Dish(name: "Rice rolls vietnam",  base: "rice", complement: "fish",
         ingridients: ["carrot","onions",]),
    Dish(name: "Mashrrrisotto",  base: "rice", complement: "other",
         ingridients: ["tomato","garlic"]),
    Dish(name: "Rice paper rolls",  base: "rice", complement: "other",
         ingridients: ["carrot","onions","pepers"]),
    Dish(name: "Pastéis de bacalhau",  base: "potato", complement: "fish",
         ingridients: ["onions","garlic"]),
    Dish(name: "FISH N CHIPS",  base: "potato", complement: "fish",
         ingridients: ["carrot","pepers"]),
    Dish(name: "Moussaka - Greece",  base: "potato", complement: "meat",
         ingridients: ["onions","tomato","garlic"]),
    Dish(name: "Shepards pie",  base: "potato", complement: "meat",
         ingridients: ["carrot","onions","tomato","garlic","pepers"]),
    Dish(name: "Patatas bravas",  base: "potato", complement: "other",
         ingridients: ["onions","tomato","garlic","pepers"]),
    Dish(name: "Potato salad",  base: "potato", complement: "other",
         ingridients: ["onions","garlic"]),
    Dish(name: "Gnocchi itali",  base: "potato", complement: "other",
         ingridients: ["onions","tomato","garlic"]),
    Dish(name: "Falafel", base: "other", complement: "other",
         ingridients: ["onions","garlic","pepers"]),
    Dish(name: "VEB Burrito mexico", base: "other", complement: "other",
         ingridients: ["carrot","onions","tomato",]),
    Dish(name: "Guacamole", base: "other", complement: "other",
         ingridients: ["onions","tomato","garlic"]),
    Dish(name: "Rice paper rolls vietnam", base: "rice", complement: "vegan",
         ingridients: ["carrot","onions",]),
    Dish(name: "Vegan Rice Noodle Salad - Thailand", base: "rice", complement: "vegan",
         ingridients: ["carrot","onions",]),
    Dish(name: "Caprese salad", base: "other", complement: "other",
         ingridients: ["tomato",]),
    Dish(name: "Empandas", base: "other", complement: "meat",
         ingridients: ["tomato","garlic","pepers"]),
    Dish(name: "Gyoza", base: "other", complement: "meat",
         ingridients: ["onions","garlic"]),
    Dish(name: "Polipetti Luciana", base: "other", complement: "fish",
         ingridients: ["onions","tomato","garlic","pepers"])
]

struct CardPickerView: View {
    @State var ingridientList: IngridientsList
    @StateObject var viewModel: CardsViewModel = CardsViewModel()
    @State var ingridientNumber: Int = 5
    
    var body: some View {
        if ingridientNumber == 0 {
            ZStack{
                Color.CustomColors.lightOrange
                    .ignoresSafeArea()
                NavigationLink(destination: DishView(dishes: dishPicker())){
                    VStack{
                        Image("burningpot")
                        Text("Matched !")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.CustomColors.orange)
                    }
                }
            }
        } else {
            ZStack{
                Color.CustomColors.orange
                    .ignoresSafeArea()
                ForEach(viewModel.ingridients.reversed()) { ingridient in
                    cardLikeDislike(currentIngridient: ingridient, ingridientList: $ingridientList, ingridientNumber: $ingridientNumber)
                }
            }
        }
    }
    func dishPicker() -> [String] {
        print(ingridientList)
        var dishList: [String] = []
        for dish in DishesMockUp {
                let containsLikedIngredients = dish.ingridients.contains { likedIngredient in
                    ingridientList.likedIngridients.contains(likedIngredient)
                }
                
                let containsDislikedIngredients = dish.ingridients.contains { dislikedIngredient in
                    ingridientList.dislikedIngridients.contains(dislikedIngredient)
                }

                if ((dish.base == ingridientList.base)
                    && (dish.complement == ingridientList.complement)
                    && (containsLikedIngredients)
                    && (!containsDislikedIngredients))
                {
                    dishList.append(dish.name)
                }
            }
        return dishList
    }
}

struct cardLikeDislike: View {
    var currentIngridient: Ingridient
    @State var display: Bool = true
    @Binding var ingridientList: IngridientsList
    @Binding var ingridientNumber: Int
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
                        Text(currentIngridient.name)
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.CustomColors.green)
                            .padding(.bottom)
                    }
                }
                HStack{
                    Spacer()
                    Button(action: {likedIngridient()}, label: {
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .padding()
                            .background(Color.CustomColors.lightOrange)
                            .foregroundStyle(Color.CustomColors.orange)
                            .frame(width: 91.2, height: 91.2)
                            .clipShape(Circle())
                    })
                    Spacer()
                    Button(action: {dislikedIngridient()}, label: {
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
        ingridientList.likedIngridients.append(currentIngridient.name)
        ingridientNumber -= 1
        self.display = false
    }
    
    func dislikedIngridient() {
        ingridientList.dislikedIngridients.append(currentIngridient.name)
        ingridientNumber -= 1
        self.display = false
    }
}

#Preview {
    CardPickerView(ingridientList:IngridientsList(
            isVegan: false,
            base: "",
            complement: "",
            likedIngridients: [],
            dislikedIngridients: []
        )
    )
}
