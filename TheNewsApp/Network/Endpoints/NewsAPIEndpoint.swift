//
//  NewsAPIEndpoint.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

enum NewsAPIEndpoint: Endpoint {
    case news(amount: Int?, page: Int?, category: CategoryModel)
    
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
        case .news(let amount, let page, let category):
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "country", value: "br"),
                URLQueryItem(name: "category", value: category.rawValue)
            ]
            
            if let amount = amount {
                queryItems.append(URLQueryItem(name: "pageSize", value: "\(amount)"))
            }
            
            if let page = page {
                queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            }
            
            return queryItems
        }
    }
    
    var headers: [String: String] {
        return ["X-Api-Key": "db6dacd884944e7d8ce0d660f974ec60"]
    }
    
    var method: String {
        switch self {
            default:
                return "GET"
        }
    }
    
}
