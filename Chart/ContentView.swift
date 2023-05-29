//
//  ContentView.swift
//  Chart
//
//  Created by Kacper Biaduń on 30/05/2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let viewMonths: [viewMonth] = [
        .init(date: Date.from(day: 23, month: 10, year: 2019), viewNumbers: 20030),
        .init(date: Date.from(day: 23, month: 10, year: 2020), viewNumbers: 1000),
        .init(date: Date.from(day: 23, month: 10, year: 2021), viewNumbers: 18920),
        .init(date: Date.from(day: 23, month: 10, year: 2022), viewNumbers: 40031),
        .init(date: Date.from(day: 23, month: 10, year: 2023), viewNumbers: 7000),
        .init(date: Date.from(day: 23, month: 10, year: 2024), viewNumbers: 17020),
        .init(date: Date.from(day: 23, month: 10, year: 2025), viewNumbers: 123034),
        .init(date: Date.from(day: 23, month: 10, year: 2026), viewNumbers: 15203),
    ]
    
    
    var body: some View {
        VStack {
            Text("Chart example")
                .font(.system(size: 40))
            Chart{
                ForEach(viewMonths) { viewMonth in
                    BarMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.viewNumbers))
                }
            }
            .frame(height: 180)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct viewMonth: Identifiable{
    let id = UUID()
    let date: Date
    let viewNumbers: Int
}

extension Date {
    static func from(day: Int, month: Int, year: Int) -> Date{
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
    
}

