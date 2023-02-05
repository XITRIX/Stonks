//
//  StocksView.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import Charts
import SwiftUI
import UIKit
import RxSwift
import RxRelay

struct ChartSegment: Identifiable {
    let id = UUID()
    var date: Date
    var price: Double
}

struct ChartData {
    var segments: [ChartSegment]
    var closed: Double?
    var start = Date()
    var end = Date()
    var isPositive: Bool = true
    var simplefied: Bool = false
}

class ChartViewData: ObservableObject {
    @Published var data: ChartData

    init(data: ChartData) {
        self.data = data
    }
}

struct ChartView: View {
    @ObservedObject var data: ChartViewData

    var chartColor: Color {
        Color(uiColor: data.data.isPositive ? .stockGreen : .stockRed)
    }

    var body: some View {
        let prices = data.data.segments.map{ $0.price }

        if !prices.isEmpty {
            Chart {
                if let closed = data.data.closed {
                    RuleMark(y: .value("Last chart close", closed))
                        .lineStyle(.init(lineWidth: 0.5, lineCap: .round, lineJoin: .round, dash: [2]))
                        .foregroundStyle(data.data.simplefied ? chartColor : .gray)
                }
                ForEach(data.data.segments) { item in
                    LineMark(x: .value("Hour", item.date), y: .value("Price", item.price))
                        .lineStyle(.init(lineWidth: 2, lineCap: .square, lineJoin: .miter))
                        .foregroundStyle(chartColor)

                }
            }
            // Not working properly, need to investigate
//            .chartXScale(domain: data.data.start ... data.data.end)
            .chartXAxis {
                AxisMarks(values: .automatic(desiredCount: 5))
            }
            .chartXAxis(data.data.simplefied ? .hidden : .visible)
            .chartYAxis {
                AxisMarks(values: .automatic(desiredCount: 4))
            }
            .chartYScale(domain: prices.min()! ... prices.max()!)
            .chartYAxis(data.data.simplefied ? .hidden : .visible)
        }
    }
}
