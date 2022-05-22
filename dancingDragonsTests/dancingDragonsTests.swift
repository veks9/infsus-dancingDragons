//
//  dancingDragonsTests.swift
//  dancingDragonsTests
//
//  Created by Luka Bokarica on 22.05.2022..
//

import XCTest
import RxSwift
@testable import dancingDragons

class dancingDragonsTests: XCTestCase {
    private let disposeBag = DisposeBag()

    override func setUpWithError() throws {
      try super.setUpWithError()
    }

    override func tearDownWithError() throws {
      try super.tearDownWithError()
    }
    
    // MARK: Testovi sloja za pristup podacima
    func testAlbumFetchAndCountFALSE() {
        let sut = AlbumService()
        
        // given
        let albumCount = 10
        
        let promise = expectation(description: "Status code: 200")
        
        // when
        sut.getAlbums()
            .subscribe(onNext: { [weak self] albums in
                guard let self = self else { return }
                XCTAssertEqual(albums.count, albumCount, "The number of albums is wrong!!!")
                promise.fulfill()
            })
            .disposed(by: disposeBag)
        
        wait(for: [promise], timeout: 2)
    }
    
    func testSongFetchAndCountTRUE() {
        let sut = SongService()
        
        // given
        let songCount = 50
        
        let promise = expectation(description: "Status code: 200")
        
        // when
        sut.getSongs()
            .subscribe(onNext: { [weak self] songs in
                guard let self = self else { return }
                XCTAssertEqual(songs.count, songCount, "The number of songs is wrong!!!")
                promise.fulfill()
            })
            .disposed(by: disposeBag)
        
        wait(for: [promise], timeout: 2)
    }
    
    // MARK: Testovi poslovnog sloja
    func testSongsViewModelTRUE() {
        let sut = SongsViewModel()
        
        let promise = expectation(description: "Status code: 200")
        
        sut.fetch()
            
        promise.fulfill()

        wait(for: [promise], timeout: 2)

        XCTAssertEqual(sut.filteredData.count, sut.dataSource.count, "The number of songs is wrong!!!")
    }
    
    // MARK: Testovi prezentacijskog sloja
    func testAlbumsViewControllerTRUE() {
        let sut = AlbumsViewController(viewModel: AlbumsViewModel())
        
        lazy var albumNameLabel: UILabel = {
            let label = UILabel()
            
            return label
        }()
        
        sut.view.addSubview(albumNameLabel)
        
        XCTAssertTrue(sut.view.subviews.contains(albumNameLabel))
    }
    
    func testAlbumsViewControllerFALSE() {
        let sut = SongsViewController(viewModel: SongsViewModel())
        
        lazy var songNameLabel: UILabel = {
            let label = UILabel()
            
            return label
        }()
        
        lazy var songNameLabel2: UILabel = {
            let label = UILabel()
            
            return label
        }()
        
        sut.view.addSubview(songNameLabel)
        
        XCTAssertTrue(sut.view.subviews.contains(songNameLabel2))
    }
    
    
    // MARK: Testovi povezanosti poslovnog sloja i sloja za pristup podacima
    func testAlbumsViewModelConnectsToAlbumsServiceTRUE() {
        let sut = AlbumsViewModel(albumService: AlbumService())
                
        let promise = expectation(description: "Status code: 200")
        
        sut.fetch()
        
        promise.fulfill()
        
        wait(for: [promise], timeout: 2)
    }
    
    func testSongsViewModelConnectsToSongsServiceTRUE() {
        let sut = SongsViewModel()

        let promise = expectation(description: "Status code: 200")
        
        sut.fetch()
        
        promise.fulfill()
        
        wait(for: [promise], timeout: 2)
    }

    // MARK: Testovi povezanosti prezentacijskog i poslovnog sloja
    func testSongsViewControllerConnectsToSongsViewModelTRUE() {
        let sut = SongsViewController(viewModel: SongsViewModel())

        let promise = expectation(description: "Status code: 200")
        
        sut.viewModel.fetch()
        
        promise.fulfill()

        wait(for: [promise], timeout: 2)

        XCTAssertEqual(sut.viewModel.filteredData.count, sut.viewModel.dataSource.count, "The number of songs is wrong!!!")
    }
    
    func testAlbumsViewControllerConnectsToAlbumsViewModelFALSE() {
        let sut = AlbumsViewController(viewModel: AlbumsViewModel(albumService: AlbumService()))
        
        let promise = expectation(description: "Status code: 200")
        
        promise.fulfill()

        wait(for: [promise], timeout: 3)
        
        XCTAssertEqual(sut.viewModel.dataSource.count, 13, "The number of songs is wrong!!!")
    }
}
