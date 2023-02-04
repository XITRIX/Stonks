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

class StocksViewData: ObservableObject {
    @Published var data: ChartData

    init(data: ChartData) {
        self.data = data
    }
}

struct StocksView: View {
    @ObservedObject var data: StocksViewData

    var body: some View {
        let prices = data.data.segments.map{ $0.price }
        if !prices.isEmpty {
            Chart {
                if let start = data.data.start {
                    RuleMark(y: .value("Last chart close", start))
                        .lineStyle(.init(lineWidth: 0.5, lineCap: .round, lineJoin: .round, dash: [2]))
                        .foregroundStyle(.gray)
                }
                ForEach(data.data.segments) { item in
                    LineMark(x: .value("Hour", item.date), y: .value("Price", item.price))
                        .lineStyle(.init(lineWidth: 2, lineCap: .square, lineJoin: .miter))
                        .foregroundStyle(Color(uiColor: data.data.isPositive ? .stockGreen : .stockRed))

                }
            }
            .chartYScale(domain: prices.min()! ... prices.max()!)
            .chartXAxis {
                AxisMarks(values: .automatic(desiredCount: 5))
            }
        }
    }
}

class StocksChartView: UIHostingController<StocksView> {
    let chart = BehaviorRelay<ChartData>(value: ChartData(segments: []))

    init() {
        super.init(rootView: StocksView(data: data))

        bind(in: disposeBag) {
            chart.bind { [unowned self] data in
                DispatchQueue.main.async {
                    self.data.data = data
                }
            }
        }
    }

    @available(*, unavailable)
    @MainActor dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private let data = StocksViewData(data: ChartData(segments: []))
    private let disposeBag = DisposeBag()
}
