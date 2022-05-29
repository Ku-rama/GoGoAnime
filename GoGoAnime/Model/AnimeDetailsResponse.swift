//
//  AnimeDetailsResponse.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import Foundation

struct AnimeDetailsResponse: Codable{
    var data: AnimeDetails?
}

struct AnimeDetails: Codable{
    var anilist_id: Int?
    var mal_id: Int?
    var titles: titels?
    var descriptions: descriptions?
    var start_date: String?
    var end_date: String?
    var season_period: Int?
    var season_year: Int?
    var episodes_count: Int?
    var episode_duration: Int?
    var trailer_url: String?
    var cover_image: String?
    var banner_image: String?
    var score: Int?
    var nsfw: Bool?
    var id: Int?
}

struct titels: Codable{
    var rj: String?
    var en: String?
    var jp: String?
}

struct descriptions: Codable{
    var en: String?
}
