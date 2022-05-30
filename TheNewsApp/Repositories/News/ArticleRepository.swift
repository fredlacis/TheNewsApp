//
//  ArticleRepository.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

protocol ArticleRepository {
    
    typealias NewsResult = (Result<[Article], Error>) -> Void
    
    func getNews(ammount: Int?, page: Int?, category: Category, completionHandler: @escaping NewsResult)
    
}
