//
//  AlbumCellView.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import UIKit

class AlbumCellView: UITableViewCell {
    private var viewModel: AlbumCellViewModel?
    
    // MARK: - Views
    
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setStyle(textColor: .appBlack, font: .systemFont(ofSize: CGFloat(15)))
        
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
        addSubview(coverImageView)
        addSubview(titleLabel)
    }
    
    private func setConstraints() {
        coverImageView.snp.remakeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        titleLabel.snp.remakeConstraints {
            $0.leading.equalTo(coverImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func updateUI(viewModel: AlbumCellViewModel) {
        coverImageView.setImage(viewModel.image)
        titleLabel.text = viewModel.title
    }
}
