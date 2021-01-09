//
//  ContentView.swift
//  coffeeTracker
//
//  Created by Ben Cheng on 1/8/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // Control Edit Detail modal window
    @State var showEditView = false
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Coffee.entity(), sortDescriptors: [])

    var items: FetchedResults<Coffee>
    //var coffees: FetchedResults<Coffee>
    //@FetchRequest(
    //    sortDescriptors: [NSSortDescriptor(keyPath: \Coffee.date, ascending: true)],
    //    animation: .default)
    
    var body: some View {
        //Button(action: addItem) {
        //    Label("Add Item", systemImage: "plus")
        //}
        Button(action: {
            showEditView = true
        }, label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
        })
        Text("Hello there").font(.title)
        VStack{
            List {
                ForEach(items) { item in
                    CoffeeView(coffee:item)
                }

                .onDelete(perform: deleteItems)
            }
            .sheet(isPresented: $showEditView){
                EditCoffeeDetailsView()
            }

            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                
//                Button(action: addItem) {
 //                   Label("Add Item", systemImage: "plus")
 //               }
            }
        }

    }

    private func editItem() {
        withAnimation {

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
    
    private func addItem() {
        withAnimation {
            let newItem = Coffee(context: viewContext)
            newItem.date = Date()
            newItem.name = "Enter Name"
            newItem.roastType = "Light"
            newItem.origin = "Ethiopia"
            //newItem.flavorNotes = ["sweet", "citrus"]

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
