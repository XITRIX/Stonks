//
//  StockDetailsViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

class StockDetailsViewController<VM: StockDetailsViewModelProtocol>: MvvmViewController<VM> {
    @IBOutlet private var symbolLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var currencyLabel: UILabel!
    @IBOutlet private var summaryLabel: UILabel!
    @IBOutlet private var changeLabel: UILabel!

    @IBOutlet private var onOpenLabel: UILabel!
    @IBOutlet private var highLabel: UILabel!
    @IBOutlet private var lowLabel: UILabel!
    @IBOutlet private var volumeLabel: UILabel!
    @IBOutlet private var peLabel: UILabel!
    @IBOutlet private var marketCapLabel: UILabel!
    @IBOutlet private var w25HLabel: UILabel!
    @IBOutlet private var w25LLabel: UILabel!
    @IBOutlet private var averageVolumeLabel: UILabel!
    @IBOutlet private var yieldLabel: UILabel!
    @IBOutlet private var betaLabel: UILabel!
    @IBOutlet private var epsLabel: UILabel!

    @IBOutlet private var summaryScrollView: UIScrollView!
    @IBOutlet private var chartsHolder: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        setupCharts()

        bind(in: disposeBag) {
            symbolLabel.rx.text <- viewModel.symbol
            nameLabel.rx.text <- viewModel.name
            currencyLabel.rx.textWithVisibility <- viewModel.currency
            summaryLabel.rx.text <- viewModel.summary
            changeLabel.rx.text <- viewModel.change.map(Formatter.changeFormatter.format(from:))
            changeLabel.rx.textColor <- viewModel.change.map(Formatter.stockColor(from:))

            onOpenLabel.rx.text <- viewModel.onOpen.map(dashIfEmpty)
            highLabel.rx.text <- viewModel.high.map(dashIfEmpty)
            lowLabel.rx.text <- viewModel.low.map(dashIfEmpty)
            volumeLabel.rx.text <- viewModel.volume.map(dashIfEmpty)
            peLabel.rx.text <- viewModel.pe.map(dashIfEmpty)
            marketCapLabel.rx.text <- viewModel.marketCap.map(dashIfEmpty)
            w25HLabel.rx.text <- viewModel.w25H.map(dashIfEmpty)
            w25LLabel.rx.text <- viewModel.w25L.map(dashIfEmpty)
            averageVolumeLabel.rx.text <- viewModel.averageVolume.map(dashIfEmpty)
            yieldLabel.rx.text <- viewModel.yield.map(dashIfEmpty)
            betaLabel.rx.text <- viewModel.beta.map(dashIfEmpty)
            epsLabel.rx.text <- viewModel.eps.map(dashIfEmpty)

            charts.chart <- viewModel.chart
        }
    }

    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        summaryScrollView.contentInset.left = view.layoutMargins.left - 10
        summaryScrollView.contentInset.right = view.layoutMargins.right - 10
    }

    // MARK: - Private
    private let charts = StocksChartView()
}

extension StockDetailsViewController {
    func dashIfEmpty(for text: String?) -> String {
        guard let text
        else { return "—" }

        return text.isEmpty ? "—" : text
    }

    func setupCharts() {
        chartsHolder.addSubview(charts.view)
        charts.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            charts.view.leadingAnchor.constraint(equalTo: chartsHolder.leadingAnchor),
            charts.view.topAnchor.constraint(equalTo: chartsHolder.topAnchor),
            chartsHolder.trailingAnchor.constraint(equalTo: charts.view.trailingAnchor),
            chartsHolder.bottomAnchor.constraint(equalTo: charts.view.bottomAnchor)
        ])
        addChild(charts)
        charts.didMove(toParent: self)
    }
}
