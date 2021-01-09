//
//  EditCoffeeDetailsView.swift
//  coffeeTracker
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI

struct AddCoffeeView: View {
    
           
    @Environment(\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode

        @State var id = UUID()
        @State var name = ""
        @State var origin = ""
        @State var roastType = ""
        @State var rating: Int16 = 3
        
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("About your coffee")) {
                        TextField("Coffee name", text: $name)
                        TextField("Country of origin", text: $origin)
                        TextField("How light is your roast?", text: $roastType)
                        HStack{
                            Stepper("Overall rating", value: $rating, in: 1...5)
                            Text(" \(rating)")
                        }
                    }
                    HStack{
                        
                        Button(action: {
                            print("Save the order!")
                            let coffee = Coffee(context:viewContext)
                            coffee.id = id
                            coffee.date = Date()
                            coffee.name = name
                            coffee.origin = origin
                            coffee.roastType = roastType
                            coffee.rating = rating
                            do {
                                try viewContext.save()
                                print("Order saved.")
                                presentationMode.wrappedValue.dismiss()
                                } catch {
                                    print(error.localizedDescription)
                                }
                        }) {
                            Text("Save")
                        }
                        Spacer()
                        Text("Discard").onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                    .navigationTitle("New Coffee")
            }
        }
    }
