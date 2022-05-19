//
//  SongsViewController.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import UIKit
import SnapKit
import RxSwift

class SongsViewController: UIViewController {
    let viewModel: SongsViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Views
    private lazy var songsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(SongCellView.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: SongsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        observe()
        title = "Songs"
        view.backgroundColor = .appWhite
    }
    
    private func addSubviews() {
        view.addSubview(songsTableView)
    }
    
    private func setConstraints() {
        songsTableView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func observe() {
        viewModel.tableViewReloadRelay
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.songsTableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDataSource

extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.dataSource[indexPath.row] {
        case .song(let viewModel):
            let cell: SongCellView = tableView.dequeueCellAtIndexPath(indexPath: indexPath)
            cell.updateUI(viewModel: viewModel)

            return cell
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
}

// MARK: - UITableViewDelegate

extension SongsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch viewModel.dataSource[indexPath.row] {
//        case .song(let viewModel):
//            present(AlbumDetailsViewController(viewModel: AlbumDetailsViewModel(id: viewModel.id, title: viewModel.title, year: viewModel.year, cover: viewModel.image)), animated: true, completion: nil)
//        }
//    }
}
