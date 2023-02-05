//
//  StocksViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import RxCocoa
import RxSwift
import UIKit

class StocksViewController<VM: StocksViewModelProtocol>: MvvmTableViewController<VM> {
    // MARK: - Public
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupSearchBar()
        setupRefreshControl()

        bind(in: disposeBag) {
            searchController.searchBar.rx.placeholder <- viewModel.searchHint
            searchController.searchBar.rx.text <-> viewModel.searchQuery
            viewModel.stocks.bind(onNext: updateDataSource(_:))
            tableView.rx.itemSelected.map(stock(for:)).bind(onNext: viewModel.selectStock(_:))
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in } completion: { [self] _ in
            self.tableView.reloadData()
        }
    }

    // MARK: - Private
    private lazy var delegates = Delegates(parent: self)
    private lazy var dataSource: UITableViewDiffableDataSource<Int, StockCellModel> = makeDataSource()
    private let searchController = UISearchController()

    // MARK: - Private objc functions
    @objc private func refreshStocks(_ sender: UIRefreshControl) {
        Task {
            await viewModel.refreshStocks()
            sender.endRefreshing()
        }
    }
}

// MARK: - Private functions
private extension StocksViewController {
    func stock(for indexPath: IndexPath) -> StockCellModel {
        dataSource.snapshot().itemIdentifiers(inSection: 0)[indexPath.row]
    }

    func setupTableView() {
        tableView.register(StockCell.self)
        tableView.dataSource = dataSource
    }

    func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = delegates
    }

    func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = .clear
        refreshControl.addTarget(self, action: #selector(refreshStocks), for: .valueChanged)
        self.refreshControl = refreshControl
    }

    private func makeDataSource() -> UITableViewDiffableDataSource<Int, StockCellModel> {
        UITableViewDiffableDataSource<Int, StockCellModel>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell: StockCell = tableView.dequeue(for: indexPath)
            cell.setup(with: itemIdentifier)
            cell.isCompact = tableView.safeAreaLayoutGuide.layoutFrame.width < 320
            return cell
        }
    }

    private func updateDataSource(_ models: [StockCellModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, StockCellModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(models)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot)
        }
    }
}

// MARK: - Delegates
private extension StocksViewController {
    class Delegates: DelegateObject<StocksViewController>, UISearchBarDelegate {
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            parent.viewModel.searchQuery.accept(nil)
        }
    }
}
