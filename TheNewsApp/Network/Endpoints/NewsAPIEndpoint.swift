//
//  NewsAPIEndpoint.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

enum NewsAPIEndpoint: Endpoint {
    case news(ammount: Int?, page: Int?, category: Category)
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return "newsapi.org"
    }
    
    var path: String {
        switch self {
            case .news:
                return "/v2/top-headlines"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .news(let ammount, let page, let category):
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "country", value: "br"),
                URLQueryItem(name: "category", value: category.rawValue)
            ]
            
            if let ammount = ammount {
                queryItems.append(URLQueryItem(name: "pageSize", value: "\(ammount)"))
            }
            
            if let page = page {
                queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            }
            
            return queryItems
        }
    }
    
    var headers: [String: String] {
        return ["X-Api-Key": "1513b7d576e543e4b2a87a0787849685"]
    }
    
    var method: String {
        switch self {
            default:
                return "GET"
        }
    }
    
}
