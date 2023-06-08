//
//  NewsListInteractor.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

// MARK: - Interactor Implementation
class NewsListInteractor: NewsListInteractorProtocol {
    
    var presenter: NewsListPresenterOutputProtocol?
    
    var articleRepository: ArticleRepository?
    
    func fetchHighlights(with category: CategoryModel) {
        articleRepository?.getNews(amount: 20, page: 1, category: category) { [weak self] result in
            switch result {
                case .success(let articles):
                    self?.presenter?.didFetchHighlights(articles)
                case .failure(let error):
                    self?.presenter?.didFailFetchingHighlights(error)
            }
        }
    }
    
    func fetchNews(with category: CategoryModel) {
        articleRepository?.getNews(amount: 10, page: 1, category: category) { [weak self] result in
            switch result {
                case .success(let articles):
                    self?.presenter?.didFetchNews(articles)
                case .failure(let error):
                    self?.presenter?.didFailFetchingNews(error)
            }
        }
    }
    
}
