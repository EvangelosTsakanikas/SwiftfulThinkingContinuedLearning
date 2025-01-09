//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by user274186 on 1/9/25.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // Current Time
    /*
     @State var currentDate: Date = Date()
     var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     //        formatter.dateStyle = .medium
     formatter.timeStyle = .medium
     return formatter
     }
     */
    
    // Countdown
    /*
     @State var count: Int = 10
     @State var finishedText: String? = nil
     */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "minutes: \(minute), seconds: \(second)"
    }
     */
    
    // Animation counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.purple, .indigo]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            //            Text(dateFormatter.string(from: currentDate))
            //                .font(.system(size: 100, weight: .semibold, design: .rounded))
            //                .foregroundStyle(.white)
            //                .lineLimit(1)
            //                .minimumScaleFactor(0.1)
            //            Text(finishedText ?? "\(count)")
            //                .font(.system(size: 100, weight: .semibold, design: .rounded))
            //                .foregroundStyle(.white)
            //                .lineLimit(1)
            //                .minimumScaleFactor(0.1)
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundStyle(.white)
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.gray)
                    .tag(5)
                
            }
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        //        .onReceive(timer) { value in
        //            currentDate = value
        //        }
        //        .onReceive(timer) { _ in
        //            if count <= 1 {
        //                finishedText = "Wow!"
        //            } else {
        //                count -= 1
        //            }
        //        }
//        .onReceive(timer) { _ in
//            updateTimeRemaining()
//        }
//        .onReceive(timer) { _ in
//            withAnimation(.easeInOut(duration: 0.5)) {
//                count = count == 3 ? 0 : count + 1
//            }
//        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        }
        
    }
}

#Preview {
    TimerBootcamp()
}
