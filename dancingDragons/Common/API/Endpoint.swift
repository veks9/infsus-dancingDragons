//
//  Endpoint.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 07.05.2022..
//

import Foundation

enum Endpoint {
    case allArtists
    case allAlbumsFromArtist(Int)
    case artist(Int)
    case artistsByGenre(Int)
    case createArtist
    case deleteArtist(Int)
    case addAlbumToArtist(Int)
    case createAlbum
    case createSong
    case addSongsToAlbum(Int)
    case songsFromAlbum(Int)
    case agent(Int)
    case login
    case ping
    case user(Int)
    case allAlbums

    var path: String {
       NetworkConstants.baseURLString + _path
    }

    private var _path: String {
        switch self {
        case .allArtists:
            return "/artist"
        case .allAlbumsFromArtist(let artistId):
            return "/artist/\(artistId)/albums"
        case .artist(let artistId):
            return "/artist/\(artistId)"
        case .artistsByGenre(let genreId):
            return "/genre/\(genreId)"
        case .createArtist:
            return "/artist/add"
        case .deleteArtist(let artistId):
            return "/artist/\(artistId)/remove"
        case .addAlbumToArtist(let artistId):
            return "/artist/\(artistId)/addAlbum"
        case .createAlbum:
            return "/album/add"
        case .createSong:
            return "/song/add"
        case .addSongsToAlbum(let albumId):
            return "/album/\(albumId)/songs/add"
        case .songsFromAlbum(let albumId):
            return "/album/\(albumId)/songs"
        case .agent(let agentId):
            return "/agent/\(agentId)"
        case .login:
            return "/login"
        case .ping:
            return "/"
        case .user(let userId):
            return "/user/\(userId)/info"
        case .allAlbums:
            return "/album/all"
        }
    }
}
