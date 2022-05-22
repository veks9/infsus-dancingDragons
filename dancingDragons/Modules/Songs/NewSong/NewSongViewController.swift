//
//  NewSongViewController.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 20.05.2022..
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewSongViewController: UIViewController {
    var viewModel: NewSongViewModel
    private let disposeBag = DisposeBag()
        
    // MARK: - Views
    private lazy var newSongView = NewSongView()
    
    
    // MARK: - Lifecycle
    init(viewModel: NewSongViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.newSongView = NewSongView()
        self.newSongView.updateUI(viewModel: viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        viewModel.fetch(id: viewModel.id)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        observe()
    }
    
    private func addSubviews() {
        view.addSubview(newSongView)
    }

    private func setConstraints() {
        newSongView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func observe() {
    }
}
