//
//  FeaturedApp.swift
//  AppStoreClone
//
//  Created by edwin on 02/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import Foundation

struct FeaturedApp: Codable {
    var bannerCategory: AppCategory?
    var categories: [AppCategory]?
    
    static func fetchFeaturedApp(completionHandler: @escaping (Result<FeaturedApp, Error>) -> ()) {
        let url = URL(string: "https://api.letsbuildthatapp.com/appstore/featured")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(FeaturedApp.self, from: data)
                completionHandler(.success(result))
             
            } catch {
                completionHandler(.failure(error))
            }
        }.resume()
    }
}
