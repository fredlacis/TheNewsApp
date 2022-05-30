//
//  EndpointsProtocol.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

protocol Endpoint {
    
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var headers: [String: String] { get }
    var method: String { get }
    
    func urlComponents() -> URLComponents
    
}

extension Endpoint {
    
    func urlComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.baseURL
        components.path = self.path
        components.queryItems = self.parameters
        return components
    }
    
}
