//
//  NewYorkTimesAPIResponse.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 08/06/23.
//

import Foundation

struct NewYorkTimesAPIResponse: Codable {
    let results: [NewYorkTimesAPIArticle]
}

struct NewYorkTimesAPIArticle: Codable {
    let title: String?
    let abstract: String?
    let url: String?
    let uri: String?
    let byline: String?
    let createdDate: String?
    let multimedia: [NewYorkTimesAPIMultimedia]?
    let shortURL: String?

    enum CodingKeys: String, CodingKey {
        case title, abstract, url, uri, byline
        case createdDate = "created_date"
        case multimedia
        case shortURL = "short_url"
    }
}

struct NewYorkTimesAPIMultimedia: Codable {
    let url: String?
    let caption: String?
}
