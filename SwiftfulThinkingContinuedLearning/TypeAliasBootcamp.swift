//
//  TypeAliasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/8/25.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emily", count: 20)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypeAliasBootcamp()
}
