//
//  MockErrorArticleRepository.swift
//  TheNewsAppTests
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import Foundation
@testable import TheNewsApp

class MockErrorArticleRepository: ArticleRepository {

    func getNews(ammount: Int?, page: Int?, category: TheNewsApp.Category, completionHandler: @escaping NewsResult) {
        completionHandler(.failure(WebService.NetworkError.serverError))
    }

}
