//
//  APICaller.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import Foundation

final class APICaller{
    
    static let shared = APICaller()
    
    var anime = [Anime]()
        
    private init(){
        
        
    }
    
    struct Constants{
        static let baseUrl: String = "https://api.aniapi.com/v1"
    }
    
    enum APIError: Error{
        case failedToGetData
    }
    
    // MARK:- ANIME
    
    public func getAnime(completion: @escaping(Result<[Anime], Error>) -> Void){
        
        createRequest(with: URL(string: Constants.baseUrl+"/anime/"), type: .GET) { request in
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if let myResult = result as? [String: AnyObject]{
                        guard let item = myResult["data"] as? [String: AnyObject], let document = item["documents"] as? [[String: AnyObject]] else{
                            return
                        }
                        document.forEach { element in
                            var temp =  Anime()
                            temp.anilist_id = element["anilist_id"] as? Int
                            temp.mal_id = element["mal_id"] as? Int
                            temp.tmdb_id = element["tmdb_id"] as? Int
                            temp.format = element["format"] as? Int
                            guard let title = element["titles"] else{
                                return
                            }
                            temp.titles = title["en"] as? String
                            temp.cover_image = element["cover_image"] as? String
                            temp.id = element["id"] as? Int
                            self.anime.append(temp)
                        }
                        
                        let encoder = JSONEncoder()
                        if let jsonData = try? encoder.encode(self.anime){
                            
                            let resu = try JSONDecoder().decode([Anime].self, from: jsonData)
                            completion(.success(resu))
                        }
                    }
                }
                catch{
                    print(error)
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    }
    
    public func getAnimeDetails(for animeId: Int, completion: @escaping(Result<AnimeDetailsResponse, Error>) -> Void){
        guard let ApiUrl = URL(string: Constants.baseUrl+"/anime/\(animeId)") else{
            return
        }
        print(ApiUrl)
        createRequest(with: ApiUrl, type: .GET) { request in
           
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let resu = try JSONDecoder().decode(AnimeDetailsResponse.self, from: data)
                    completion(.success(resu))
                }
                catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    enum HTTPMethod: String{
        case GET
        case POST
    }
    
    private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void){
        
        guard let url = url else{
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        completion(request)
    }
}




