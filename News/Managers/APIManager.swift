//
//  APIManager.swift
//  News
//
//  Created by O'lmasbek on 22/08/23.
//

import Foundation


final class APIManager {
    static let shared = APIManager()
    
    struct Constants {
        static let baseUrl = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-08-21&to=2023-08-21&sortBy=popularity&apiKey=1bcc83b0e2034189abdf03347f8389f3")
    }
    
    
    public func getNews(completion: @escaping(Result<[String], Error>) -> Void) {
        guard let url = Constants.baseUrl else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(NewsModel.self, from: data)
                    print("\(response.articles.count)")
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
