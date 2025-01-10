//
//  AccessibilityTextBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import SwiftUI

// Dynamic Text

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 50))
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    }
                    .frame(height: 100)
                    .background(.red)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello wold!")
        }
    }
}

extension DynamicTypeSize {
    
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge:
            return 0.8
        default:
            return 0.85
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}
