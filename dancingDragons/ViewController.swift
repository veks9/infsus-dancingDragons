//
//  ViewController.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 07.05.2022..
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AlbumService().addSongsToAlbum(albumId: 3, songIds: [1,2,3])
            .subscribe(onNext: { [weak self] response in
                guard let self = self else { return }
            })
            .disposed(by: disposeBag)
        
//        UserService().getUser(with: 10)
//            .subscribe(onNext: { [weak self] response in
//                guard let self = self else { return }
//            })
//            .disposed(by: disposeBag)
    }
}
