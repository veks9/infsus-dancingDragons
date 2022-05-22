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
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search song titles"
        
        return searchBar
    }()
    
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
        let rightItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showSongDetails))
        navigationItem.rightBarButtonItem = rightItem
        view.backgroundColor = .appWhite
    }
    
    private func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(songsTableView)
    }
    
    private func setConstraints() {
        searchBar.snp.remakeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        songsTableView.snp.remakeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(5)
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
    
    @objc func showSongDetails() {
        present(NewSongViewController(viewModel: NewSongViewModel(id: 0, title: "", artistIds: [], albumId: 0)), animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.filteredData[indexPath.row] {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.filteredData[indexPath.row] {
        case .song(let viewModel):
            present(AlbumDetailsViewController(viewModel: AlbumDetailsViewModel(id: 0, title: viewModel.title, year: "", cover: String(viewModel.albumId ?? 0))), animated: true, completion: nil)
        }
    }
}

extension SongsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filteredData = searchText.isEmpty ? viewModel.dataSource : viewModel.dataSource.filter { (item: SongCellType) -> Bool in
            // If dataItem matches the searchText, return true to include it
            switch item {
            case .song(let viewModel):
                return viewModel.title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
        }
        songsTableView.reloadData()
    }
}

