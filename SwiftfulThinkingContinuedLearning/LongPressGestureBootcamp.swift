//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user268168 on 12/2/24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        // start of press to the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        // at the min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            })
                        }
                    }
                
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
            
        }
        
        //        Text(isComplete ? "Completed" : "Not complete")
        //            .padding()
        //            .padding(.horizontal)
        //            .background(isComplete ? .green : .gray)
        //            .clipShape(.rect(cornerRadius: 10))
        //            .onLongPressGesture(minimumDuration: 2.0, maximumDistance: 1, perform: {
        //                isComplete.toggle()
        //            })
    }
}

#Preview {
    LongPressGestureBootcamp()
}
