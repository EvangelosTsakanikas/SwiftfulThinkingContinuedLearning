//
//  AccessibilityVoiceOverBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        
                        Text(isActive ? "On" : "Off")
                            .accessibilityHidden(true)
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(isActive ? "is on" : "is off")
                    .accessibilityHint("Double tap to toggle setting")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                    
                } header: {
                    Text("Preferences")
                }
                
                Section {
                    Button("Favorites") {
                        
                    }
                    .accessibilityRemoveTraits(.isButton)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    
                    Text("Favorites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            
                        }
                    
                } header: {
                    Text("Application")
                }
                
                VStack {
                    Text("Content")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image(.dragon)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(.rect(cornerRadius: 10))
                                    Text("Item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x). Image of a dragon")
                                .accessibilityHint("Double tap to open")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
