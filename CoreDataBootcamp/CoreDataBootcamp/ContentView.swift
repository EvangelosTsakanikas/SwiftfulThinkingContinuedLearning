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
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)])
    var fruits: FetchedResults<FruitEntity>
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                TextField("Add fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                
                Button {
                    addFruit()
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.indigo)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal)

                
                List {
                    ForEach(fruits) { fruit in
                        Text(fruit.name ?? "")
                            .onTapGesture {
                                updateFruit(fruit: fruit)
                            }
                    }
                    .onDelete(perform: deleteFruit)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Core Data Bootcamp")
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button(action: addFruit) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                    
//                }
//            }
        }
    }
    
    private func addFruit() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = textFieldText
            saveItems()
            textFieldText = ""
        }
    }
    		
    private func updateFruit(fruit: FruitEntity) {
        withAnimation {
            let currentName = fruit.name ?? ""
            let newName = currentName + "!"
            fruit.name = newName
            
            saveItems()
        }
    }
    
    private func deleteFruit(offsets: IndexSet) {
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
