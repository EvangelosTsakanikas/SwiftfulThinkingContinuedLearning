//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by user268168 on 12/3/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) var fruits: FetchedResults<FruitEntity>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits) { fruit in
                    Text(fruit.name ?? "")
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.plain)
            .navigationTitle("Core Data Bootcamp")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addFruit) {
                        Label("Add Item", systemImage: "plus")
                    }
                    
                }
            }
        }
    }
    
    private func addFruit() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = "Orange"
            saveItems()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)
            
            // more compact version of the above
            offsets.map { fruits[$0] }.forEach(viewContext.delete)
            
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
