//
//  NewSongView.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 22.05.2022..
//

import Foundation
import UIKit
import DropDown
import RxSwift
import RxCocoa
import RxGesture
import SnapKit

class NewSongView: UIView {
    private var viewModel: NewSongViewModel?
    private let disposeBag = DisposeBag()
    
    // MARK: - Views
    private lazy var songTitleField: CustomTextField = {
        let textField = CustomTextField()
        textField.updatePlaceHolderWith(string: "Song name", fontColor: .lightGray)
        textField.keyboardType = .alphabet
        textField.returnKeyType = .next
        //textField.nextTextField = firstNameField
        
        return textField
    }()
    
    private lazy var albumButton: CustomButton = {
        let button = CustomButton()
        button.titleLabel?.textColor = .appWhite
        button.setTitle("Choose album", for: .normal)
        button.backgroundColor = .appBlack
        
        return button
    }()
    
    let dropDown: DropDown = {
        let dropDown = DropDown()
        
        return dropDown
    }()
    
    init() {
        super.init(frame: .zero)
        clipsToBounds = true
        layer.cornerRadius = 15
        addSubviews()
        setConstraints()
        observe()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    private func addSubviews() {
        self.addSubview(songTitleField)
        self.addSubview(albumButton)
    }
    
    private func setConstraints() {
        songTitleField.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        
        albumButton.snp.remakeConstraints {
            $0.top.equalTo(songTitleField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
    }
    
    func updateUI(viewModel: NewSongViewModel) {
        self.viewModel = viewModel
        self.songTitleField.text = viewModel.title
        
        let album = viewModel.albums.first(where: { item in
            item.1 == viewModel.albumId
        })?.0 ?? "Choose album"
        
        print(viewModel.albums)
        
        self.albumButton.setTitle(album, for: .normal)
    }
    
    private func observe() {
        albumButton
            .rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                
                self.dropDown.anchorView = self.albumButton
                self.dropDown.dataSource = self.viewModel?.albums.map({$0.0 }) ?? []
                self.dropDown.bottomOffset = CGPoint(x: 0, y: self.albumButton.frame.size.height)
                self.dropDown.show()
                self.dropDown.selectionAction = { [weak self] (index: Int, item: String) in
                    guard let _ = self else { return }
                    self?.albumButton.setTitle(item, for: .normal)
                }
            })
            .disposed(by: disposeBag)
    }
}
