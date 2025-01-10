//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        VStack {
            
            Button("Button 1") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            
            Button("Button 2") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            Button("Button 3") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Button("Button 4") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
        .font(.largeTitle)
        .navigationTitle("Hey")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(reduceTransparency ? .black : .black.opacity(0.5))
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
