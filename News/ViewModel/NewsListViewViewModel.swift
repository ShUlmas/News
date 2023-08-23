//
//  NewsListViewViewModel.swift
//  News
//
//  Created by O'lmasbek on 23/08/23.
//

import Foundation
import UIKit

class NewsListViewViewModel: NSObject {
    var viewModels = [NewsTableViewCellViewModel]()
    
    func fetchArticles() {
        APIManager.shared.getNews { result in
            switch result {
            case .success(let articles):
                self.viewModels = articles.compactMap{NewsTableViewCellViewModel(
                    title: $0.title,
                    description: $0.description ?? "no description" ,
                    imageUrl: URL(string: $0.urlToImage ?? ""))
                }
                
                print(self.viewModels)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
extension NewsListViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellIdentifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
       
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
