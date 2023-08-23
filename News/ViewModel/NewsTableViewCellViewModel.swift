//
//  NewsTableViewCellViewModel.swift
//  News
//
//  Created by O'lmasbek on 23/08/23.
//

import Foundation


class NewsTableViewCellViewModel {
    let title: String
    let description: String
    let imageUrl: URL?
    let imageData: Data? = nil
    
    init(title: String, description: String, imageUrl: URL?) {
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
    }
}
