//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user268168 on 12/3/24.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "one", subtitle: "substring"),
        MyCustomModel(title: "two", subtitle: "substring"),
        MyCustomModel(title: "three", subtitle: "substring"),
        MyCustomModel(title: "four", subtitle: "substring"),
        MyCustomModel(title: "five", subtitle: "substring"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
