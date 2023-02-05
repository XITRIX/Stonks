//
//  StockDetailsViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

class StockDetailsViewController<VM: StockDetailsViewModelProtocol>: MvvmViewController<VM> {
    @IBOutlet private var scrollView: UIScrollView!

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
    @IBOutlet private var chartLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet private var chardErrorContainer: UIStackView!

    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        setupCharts()

        navigationItem.titleView = titleLabel
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)

        scrollView.delegate = delegates

        bind(in: disposeBag) {
            symbolLabel.rx.text <- viewModel.symbol
            nameLabel.rx.text <- viewModel.name
            currencyLabel.rx.textWithVisibility <- viewModel.currency
            summaryLabel.rx.text <- viewModel.summary
            changeLabel.rx.text <- viewModel.change.map(Formatter.changeFormatter.format(from:))
            changeLabel.rx.textColor <- viewModel.change.map(Formatter.stockColor(from:))

            onOpenLabel.rx.text <- viewModel.onOpen.map(Converter.dashIfEmpty)
            highLabel.rx.text <- viewModel.high.map(Converter.dashIfEmpty)
            lowLabel.rx.text <- viewModel.low.map(Converter.dashIfEmpty)
            volumeLabel.rx.text <- viewModel.volume.map(Converter.dashIfEmpty)
            peLabel.rx.text <- viewModel.pe.map(Converter.dashIfEmpty)
            marketCapLabel.rx.text <- viewModel.marketCap.map(Converter.dashIfEmpty)
            w25HLabel.rx.text <- viewModel.w52H.map(Converter.dashIfEmpty)
            w25LLabel.rx.text <- viewModel.w52L.map(Converter.dashIfEmpty)
            averageVolumeLabel.rx.text <- viewModel.averageVolume.map(Converter.dashIfEmpty)
            yieldLabel.rx.text <- viewModel.yield.map(Converter.dashIfEmpty)
            betaLabel.rx.text <- viewModel.beta.map(Converter.dashIfEmpty)
            epsLabel.rx.text <- viewModel.eps.map(Converter.dashIfEmpty)

            charts.chart <- viewModel.chart
            chartLoadingIndicator.rx.isAnimating <- viewModel.chartIsLoading
            chardErrorContainer.rx.isHidden <- viewModel.chartErrorOccured.map { !$0 }

            viewModel.name.bind { [unowned self] text in
                DispatchQueue.main.async {
                    self.titleLabel.text = text
                    self.titleLabel.sizeToFit()
                }
            }
        }
    }

    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()

        summaryScrollView.contentInset.left = view.layoutMargins.left - 10
        summaryScrollView.contentInset.right = view.layoutMargins.right - 10

//        summaryScrollView.contentInset.left = view.readableContentGuide.layoutFrame.minX - 10
//        summaryScrollView.contentInset.right = view.frame.width - view.readableContentGuide.layoutFrame.maxX - 10
    }

    // MARK: - Private
    private let charts = ChartViewController()
    private lazy var delegates = Delegates(parent: self)
}

extension StockDetailsViewController {
    class Delegates: DelegateObject<StockDetailsViewController>, UIScrollViewDelegate {
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.updateTitleVisibility()
        }
    }
}

private extension StockDetailsViewController {
    func updateTitleVisibility() {
        let offset = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        let hidden = nameLabel.frame.height + 16
        let transactionLength: Double = 4

        let alpha = min(max(0, offset - hidden) / transactionLength, 1)
        titleLabel.alpha = alpha
        titleLabel.isHidden = offset < hidden
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
