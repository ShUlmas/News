//
//  Articles.swift
//  News
//
//  Created by O'lmasbek on 22/08/23.
//

import Foundation

struct Article: Codable {
    let author: String
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String
    let source: Source
}
