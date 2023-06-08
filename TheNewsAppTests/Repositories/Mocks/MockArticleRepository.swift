//
//  MockArticleRepository.swift
//  TheNewsAppTests
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import Foundation
@testable import TheNewsApp

class MockArticleRepository: ArticleRepository {
    
    private let mockDatabase = [
        ArticleModel(title: "Article 1",
                description: "Description 1",
                content: "Content 1",
                authorName: "Author Name 1",
                imageURL: "",
                sourceURL: "",
                publicationDate: Date.now),
        ArticleModel(title: "Article 2",
                description: "Description 2",
                content: "Content 2",
                authorName: "Author Name 2",
                imageURL: "",
                sourceURL: "",
                publicationDate: Date.now),
        ArticleModel(title: "Article 3",
                description: "Description 3",
                content: "Content 3",
                authorName: "Author Name 3",
                imageURL: "",
                sourceURL: "",
                publicationDate: Date.now),
    ]

    func getNews(amount: Int?, page: Int?, category: TheNewsApp.CategoryModel, completionHandler: @escaping NewsResult) {
        completionHandler(.success([mockDatabase[0], mockDatabase[1]]))
    }

}
