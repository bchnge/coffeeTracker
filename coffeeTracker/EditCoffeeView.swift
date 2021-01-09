//
//  EditCoffeeDetailsView.swift
//  coffeeTracker
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI

struct EditCoffeeView: View {
    
           
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
                    Section(header: Text("Tell me about your coffee")) {
                        TextField("Coffee name", text: $name)
                        TextField("Country of origin", text: $origin)
                        TextField("How light is your roast?", text: $roastType)
                        Stepper("Brew rating \(rating)", value: $rating, in: 1...5)
                    }
                    
                    Button(action: {
                        print("Save the order!")

                        //coffee.name = name
                        //coffee.origin = origin
                        //coffee.roastType = roastType
                        //coffee.rating = rating
                        do {
                            try viewContext.save()
                            print("Order saved.")
                            presentationMode.wrappedValue.dismiss()
                            } catch {
                                print(error.localizedDescription)
                            }
                    }) {
                        Text("Save changes")
                    }
                }
                    .navigationTitle("Edit Order")
            }
        }
    }
