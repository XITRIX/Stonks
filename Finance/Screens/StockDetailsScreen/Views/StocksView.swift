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

struct A: Identifiable {
    let id = UUID()
    var x: Int
    var y: Int
}

class StocksViewData: ObservableObject {
    @Published var data: ChartData

    init(data: ChartData) {
        self.data = data
    }
}

struct StocksView: View {
    @ObservedObject var data: StocksViewData

    var body: some View {
        Chart {
            if let start = data.data.start {
                RuleMark(y: .value("Last chart close", start))
                    .lineStyle(.init(lineWidth: 0.5, lineCap: .round, lineJoin: .round, dash: [2]))
                    .foregroundStyle(.gray)
            }
            ForEach(data.data.segments) { item in
                LineMark(x: .value("Hour", item.date), y: .value("Price", item.price))
                    .lineStyle(.init(lineWidth: 2, lineCap: .square, lineJoin: .miter))
                    .foregroundStyle(Color(uiColor: .stockRed))

            }
        }
        .chartYScale(domain: .automatic(includesZero: false, reversed: false))
    }
}

class StocksChartView: UIHostingController<StocksView> {
    private let data = StocksViewData(data: ChartData(segments: []))
    let chart = BehaviorRelay<ChartData>(value: ChartData(segments: []))

    init() {
        super.init(rootView: StocksView(data: data))

        bind(in: disposeBag) {
            chart.bind { [unowned self] data in
                DispatchQueue.main.async {
                    self.data.data = data
                }
            }
//            rootView.$data <- chart
        }
    }

    @available(*, unavailable)
    @MainActor dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let disposeBag = DisposeBag()
}
