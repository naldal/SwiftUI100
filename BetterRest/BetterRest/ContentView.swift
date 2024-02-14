//
//  ContentView.swift
//  BetterRest
//
//  Created by 송하민 on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
//            .labelsHidden()
        Text(Date.now, format: .dateTime.hour().minute().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(84600)
        let range = Date.now...tomorrow
    }
    
    func exampleDates2() {
//        var component = DateComponents()
//        component.hour = 8
//        component.minute = 0
//        let date = Calendar.current.date(from: component) ?? .now
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    ContentView()
}
