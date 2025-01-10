//
//  AlignmentGuideBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/10/25.
//

import SwiftUI

struct AlignmentGuideBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello world")
                .background(.blue)
                .alignmentGuide(.leading) { dimensions in
                    return dimensions.width * 0.5
                }
            Text("This is some other text")
                .background(.red)
        }
        .background(.orange)
    }
}

#Preview {
    AlignmentGuideBootcamp()
}
