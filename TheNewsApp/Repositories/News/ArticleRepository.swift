//
//  ArticleRepository.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

protocol ArticleRepository {
    
    typealias NewsResult = (Result<[ArticleModel], Error>) -> Void
    
    func getNews(amount: Int?, page: Int?, category: CategoryModel?, completionHandler: @escaping NewsResult)
    
}
