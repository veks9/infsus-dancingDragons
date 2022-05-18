//
//  AlbumDetailsViewController.swift
//  dancingDragons
//
//  Created by Pero Bokarica on 18.05.2022..
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AlbumDetailsViewController: UIViewController {
    private let disposeBag = DisposeBag()
        
    // MARK: - Views
    private lazy var albumView = AlbumDetailsView()
    
    
    // MARK: - Lifecycle
    init(albumName: String, cover: String) {
        super.init(nibName: nil, bundle: nil)
        self.albumView = AlbumDetailsView()
        self.albumView.updateUI(viewModel: AlbumDetailsViewModel(title: albumName, cover: cover)) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }

    private func setConstraints() {
        albumView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func observe() {
    }
}
