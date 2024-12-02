//
//  MagnificationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user268168 on 12/2/24.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        withAnimation(.spring) {
                            currentAmount = 0
                        }
                    }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(.red)
//            .clipShape(.rect(cornerRadius: 10))
//            .scaleEffect(1.0 + currentAmount + lastAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged { value in
//                        currentAmount = value.magnification - 1
//                    }
//                    .onEnded{ value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
