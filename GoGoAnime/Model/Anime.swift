//
//  Anime.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import Foundation


struct Anime: Codable{
    var anilist_id: Int?
    var mal_id: Int?
    var tmdb_id: Int?
    var format: Int?
    var titles: String?
    var season_year: Int?
    var cover_image: String?
    var id: Int?
}
