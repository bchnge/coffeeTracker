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
    @State var showAddView = false
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
        Text("coffee tracker").font(.title)
        Button(action: {
            showAddView = true
        }, label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
        })
//        EditButton()
        VStack{
            NavigationView{
            List {
                ForEach(items) { item in
                    HStack{
                        CoffeeView(coffee:item)
                        Spacer()
//                        Button(action: {
//                                showEditView = true
//                        }, label: {
//                            Text(" edit ")
//                        })
                        NavigationLink(destination:CoffeeView(coffee:item)){
                            //Text("edit")
                        }
                    }
                }

                .onDelete(perform: deleteItems)
            }
            .sheet(isPresented: $showAddView){
                AddCoffeeView()
            }
            .toolbar {
                #if os(iOS)
                //EditButton()
                #endif
                
//                Button(action: addItem) {
 //                   Label("Add Item", systemImage: "plus")
 //               }
            }
            }
        }

    }
    
    private func updateItem(coffee: Coffee) {
            let id = coffee.id
            viewContext.performAndWait {
                coffee.id = id
                try? viewContext.save()
            }
        }
    private func addItem() {
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
