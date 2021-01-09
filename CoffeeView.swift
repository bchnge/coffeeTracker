//
//  CoffeeView.swift
//  coffeeCalculator
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI


struct CoffeeView: View {
        
    @Environment(\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode

    @State var coffee: Coffee
    var body: some View {
        VStack{
            NavigationView {
                Form {
                    Section(header: Text("Tell me about your coffee")) {
                        TextField("Coffee name", text: $coffee.name)
                        TextField("Country of origin", text: $coffee.origin)
                        TextField("How light is your roast?", text: $coffee.roastType)
                        Stepper("Brew rating \(coffee.rating)", value: $coffee.rating, in: 1...5)
                    }
                    .navigationTitle("Edit")
            }
            //List{
            //    ForEach(coffee.flavorNotes, id: \.self) { flavorNote in
            //        Text(flavorNote)
            //    }
           // }
            }
        }
    }
}
