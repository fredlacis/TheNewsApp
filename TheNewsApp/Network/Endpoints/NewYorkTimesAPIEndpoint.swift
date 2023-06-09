//
//  NewYorkTimesAPIEndpoint.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 08/06/23.
//

import Foundation

enum NewYorkTimesAPIEndpoint: Endpoint {
    case topStories(section: String)
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return "api.nytimes.com"
    }
    
    var path: String {
        switch self {
        case .topStories(section: let section):
            return "/svc/topstories/v2/\(section).json"
        }
    }
    
    var parameters: [URLQueryItem] {
        return [URLQueryItem(name: "api-key", value: "zY6baCE8K4qCWmRjulSqLndgxLtcHcy6")]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var method: String {
        switch self {
            default:
                return "GET"
        }
    }
    
}
