//
//  SongCellView.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import UIKit

class SongCellView: UITableViewCell {
    private var viewModel: SongCellViewModel?
    
    // MARK: - Views
    private lazy var albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setStyle(textColor: .appBlack, font: .systemFont(ofSize: CGFloat(15)))
        
        return label
    }()
    
    private lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.setStyle(textColor: .darkGray, font: .systemFont(ofSize: CGFloat(15)))
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(albumCoverImageView)
        addSubview(titleLabel)
    }
    
    private func setConstraints() {
        albumCoverImageView.snp.remakeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        titleLabel.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func updateUI(viewModel: SongCellViewModel) {
//        albumCoverImageView.setImage(viewModel.fetchAlbumCover()) 
        titleLabel.text = viewModel.title
    }
}
