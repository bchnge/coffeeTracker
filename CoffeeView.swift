//
//  CoffeeView.swift
//  coffeeCalculator
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI

struct CoffeeView: View {
    var coffee: Coffee
    var body: some View {
        VStack{
            Text(coffee.name).font(.title)
            HStack{
                Text(coffee.origin).bold()
                Text(coffee.roastType).italic()
            }
            //List{
            //    ForEach(coffee.flavorNotes, id: \.self) { flavorNote in
            //        Text(flavorNote)
            //    }
           // }
        }
    }
}
