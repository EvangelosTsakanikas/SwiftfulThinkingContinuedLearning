//
//  DragGestureBootcamp2.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user268168 on 12/2/24.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.83
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                    
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcamp2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app. This is my favorite SwiftUI course and I recommend to all of my friends to subscribe to Swiftful Thinking!")
                .multilineTextAlignment(.center)
            
            Text("Create an Account")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .clipShape(.rect(cornerRadius: 10))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 30))
    }
}
