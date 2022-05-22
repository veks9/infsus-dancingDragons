//
//  AlbumDetailsView.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 18.05.2022..
//

import Foundation
import UIKit

class AlbumDetailsView: UIView {
    private var viewModel: AlbumDetailsViewModel?
    
    // MARK: - Views
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appBlack
        label.textAlignment = .left
        label.font = label.font.withSize(40)
        
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appBlack
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 15
        addSubviews()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    private func addSubviews() {
        self.addSubview(imageView)
        self.addSubview(albumNameLabel)
        self.addSubview(yearLabel)
    }
    
    private func setConstraints() {
        imageView.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(400)
        }

        albumNameLabel.snp.remakeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(10)
            $0.height.equalTo(50)
        }

        yearLabel.snp.remakeConstraints {
            $0.top.equalTo(albumNameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(10)
            $0.height.equalTo(20)
        }
    }
    
    func updateUI(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        self.albumNameLabel.text = viewModel.title
        self.imageView.setImage(viewModel.cover)
        self.yearLabel.text = viewModel.year
    }
}
