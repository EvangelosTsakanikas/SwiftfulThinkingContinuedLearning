//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user268168 on 12/2/24.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        angle = value.rotation
                    }
                    .onEnded({ value in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0)
                        }
                    })
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
