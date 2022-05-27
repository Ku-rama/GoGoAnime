//
//  AuthManager.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    
    struct Constants{
        static let clientID: String =  "a4c3fa0c-a4ae-4a2d-9de3-5d178c3bfbeb"
        static let redirectURI: String = "http://localhost:3000/auth/"
        static let tokenAPIURL: String = "http://localhost:3000/auth/#access_token="
    }
    
    private init() {}
    
    public var signInURL: URL?{
        let baseURL: String = "https://api.aniapi.com/v1/"
        let string = "\(baseURL)oauth?response_type=code&client_id=\(Constants.clientID)&redirect_uri=\(Constants.redirectURI)"
        return URL(string: string)
    }
    
    var isSignedIn: Bool{
        return true
    }
    
    private var accessToken: String?{
        return nil
    }
    
    private var refreshToken: String?{
        return nil
    }
    
    private var tokenExpirationDate: Date?{
        return nil
    }
    
    private var shouldRefreshToken: Bool?{
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping (Bool) -> Void){
         
        // Get token
        
        guard let url = URL(string: Constants.tokenAPIURL) else{
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                print("Error we are printing \(error)")
                completion(false)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
            } catch{
                print(error.localizedDescription)
                completion(false)
            }
            
        }
        task.resume()
    }
    
    private func catchToken(){
        
    }
    
    private func refreshAccessToken(){
        
    }
    
    
    
    
}
