//
//  AlbumsViewController.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import UIKit
import SnapKit
import RxSwift

class AlbumsViewController: UIViewController {
    let viewModel: AlbumsViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Views

    private lazy var albumsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.registerCell(AlbumCellView.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.fetch()
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
        title = "Albums"
        view.backgroundColor = .appWhite
    }
    
    private func addSubviews() {
        view.addSubview(albumsTableView)
    }
    
    private func setConstraints() {
        albumsTableView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func observe() {
        viewModel.tableViewReloadRelay
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.albumsTableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension AlbumsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.dataSource.count
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      switch viewModel.dataSource[indexPath.row] {
          case .album(let viewModel):
          let cell: AlbumCellView = tableView.dequeueCellAtIndexPath(indexPath: indexPath)
          cell.updateUI(viewModel: viewModel)
          
          return cell
          }
  }
}
