//
//  MovieListViewController.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then
import SwiftGradients
import RxViewController

final class MovieListViewController: UIViewController, Bindable {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel: MovieListViewModel!
    var disposeBag = DisposeBag()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addGradient(
            colors: [.pink, .lowPink],
            direction: .topToBottom
        )
    }

    deinit {
        logDeinit()
    }

    // MARK: - Methods

    private func configView() {
        tableView.do {
            $0.register(cellType: MovieItemCell.self)
            $0.backgroundColor = .clear
            $0.delegate = self
        }
    }

    func bindViewModel() {
        let input = MovieListViewModel.Input(load: rx.viewWillAppear.mapToVoid().asDriverOnErrorJustComplete())
        let output = viewModel.transform(input, disposeBag: disposeBag)

        let subscriptions = [
            output.$isLoading
                .asDriver()
                .drive(rx.isLoading),
            output.$error
                .unwrap()
                .asDriverOnErrorJustComplete()
                .drive(rx.error),
            output.$movies
                .asObservable()
                .bind(to: tableView.rx.items) { (tableView, row, item) in
                    return tableView.dequeueReusableCell(for: IndexPath(row: row, section: 0),
                                                         cellType: MovieItemCell.self)
                        .then {
                            $0.bind(movie: item)
                        }
                }
        ]

        subscriptions.disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension MovieListViewController {}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - StoryboardSceneBased
extension MovieListViewController: StoryboardSceneBased {
    static var sceneStoryboard: UIStoryboard {
        return R.storyboard.movie()
    }
}
