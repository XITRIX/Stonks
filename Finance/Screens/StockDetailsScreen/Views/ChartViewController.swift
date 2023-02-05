//
//  ChartViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 04.02.2023.
//

import UIKit
import SwiftUI
import RxSwift
import RxRelay

class ChartViewController: UIHostingController<ChartView> {
    let chart = BehaviorRelay<ChartData>(value: ChartData(segments: []))

    init() {
        super.init(rootView: ChartView(data: data))

        bind(in: disposeBag) {
            chart.bind { [unowned self] data in
                DispatchQueue.main.async {
                    self.data.data = data
                }
            }
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }

    // MARK: - Private
    private let data = ChartViewData(data: ChartData(segments: []))
    private let disposeBag = DisposeBag()
}
