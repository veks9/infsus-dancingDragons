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
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appBlack
        label.textAlignment = .left
        label.font = label.font.withSize(40)
        
        return label
    }()
    
    private lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appBlack
        label.textAlignment = .left
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        clipsToBounds = true
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
        self.addSubview(titleLabel)
//        self.addSubview(smallLabel)
    }
    
    private func setConstraints() {
        imageView.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(400)
        }

        titleLabel.snp.remakeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.height.equalTo(80)
            $0.leading.trailing.equalToSuperview().offset(10)
        }
//
//        smallLabel.snp.remakeConstraints {
//            $0.height.equalTo(30)
//            $0.leading.trailing.equalToSuperview().offset(10)
//        }
    }
    
    func updateUI(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.imageView.setImage(viewModel.cover)
//        self.smallLabel.text = viewModel.year
    }
}
