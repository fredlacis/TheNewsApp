//
//  NewsAPIResponse.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

struct NewsAPIResponse: Codable {
    let articles: [ArticleResponse]
}

struct ArticleResponse: Codable {
    
    var title: String?
    var description: String?
    var content: String?
    var authorName: String?
    var imageURL: String?
    var sourceURL: String?
    var publicationDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case content
        case authorName = "author"
        case imageURL = "urlToImage"
        case sourceURL = "url"
        case publicationDate = "publishedAt"
    }
    
}
