//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/8/25.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen()
                .navigationTitle("Screen 1")
            )
        }
        .overlay (
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .clipShape(.rect(cornerRadius: 10))
            , alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("Deinitialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
//        DispatchQueue.global().async {
//            self.data = "New Data!!"
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data!!"
        }
    }
}

#Preview {
    WeakSelfBootcamp()
}
