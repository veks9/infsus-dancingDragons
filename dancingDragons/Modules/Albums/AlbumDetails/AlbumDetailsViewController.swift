//
//  AlbumDetailsViewController.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 18.05.2022..
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AlbumDetailsViewController: UIViewController {
    var viewModel: AlbumDetailsViewModel
    private let disposeBag = DisposeBag()
        
    // MARK: - Views
    private lazy var albumView: AlbumDetailsView = {
        let view = AlbumDetailsView()
        view.updateUI(viewModel: viewModel)
        
        return view
    }()
    
    private lazy var songsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.registerCell(SongCellView.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    init(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetch()
        
        // ako je pjesma!!!
        if(viewModel.id == 0) {
            fetchCoverImage(with: Int(viewModel.cover ?? ""))
        }
    }
    
    func fetchCoverImage(with id: Int?) {
        if let id = id {
            AlbumService().getAlbum(with: id)
                .subscribe(onNext: { [weak self] album in
                    guard let self = self else { return }
                    self.albumView.getImage().setImage(album.coverImage)
                })
                .disposed(by: disposeBag)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        observe()
    }
    
    private func addSubviews() {
        view.addSubview(albumView)
        view.addSubview(songsTableView)
    }

    private func setConstraints() {
        albumView.snp.remakeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        songsTableView.snp.remakeConstraints {
            $0.top.equalTo(albumView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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

extension AlbumDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.dataSource[indexPath.row] {
        case .song(let viewModel):
            let cell: SongCellView = tableView.dequeueCellAtIndexPath(indexPath: indexPath)
            cell.updateUI(viewModel: viewModel)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
}

