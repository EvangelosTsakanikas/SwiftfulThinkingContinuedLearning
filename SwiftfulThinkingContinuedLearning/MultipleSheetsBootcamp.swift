//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user268168 on 12/2/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State private var selectedModel: RandomModel? = nil
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
                
            }
            .sheet(item: $selectedModel) { model in // 3rd approach - use item instead of isPresented
                NextScreen(selectedModel: model)
            }
        }
        //        .sheet(isPresented: $showSheet, content: {
        //            NextScreen(selectedModel: selectedModel)
        //        })
        
    }
}

struct NextScreen: View {
    
    // 1st approach - use @Binding
    // @Binding var selectedModel: RandomModel
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
