//
//  NewsListInteractor.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import Foundation

// MARK: - Protocols
protocol NewsListInteractor {
    
    var presenter: NewsListInteractorDelegate? { get set }
    
    var articleRepository: ArticleRepository? { get set }
    
    func fetchHighlights(with category: Category)
    
    func fetchNews(with category: Category)
    
}

protocol NewsListInteractorDelegate {
    
    func didFetchHighlights(_ articles: [Article])
    
    func didFailFetchingHighlights(_ error: Error?)
    
    func didFetchNews(_ articles: [Article])
    
    func didFailFetchingNews(_ error: Error?)
    
}

// MARK: - Interactor Implementation
class NewsListInteractorImplementation: NewsListInteractor {
    
    var presenter: NewsListInteractorDelegate?
    
    var articleRepository: ArticleRepository?
    
    func fetchHighlights(with category: Category) {
        articleRepository?.getNews(ammount: 20, page: 1, category: category) { [weak self] result in
            switch result {
                case .success(let articles):
                    self?.presenter?.didFetchHighlights(articles)
                case .failure(let error):
                    self?.presenter?.didFailFetchingHighlights(error)
            }
        }
    }
    
    func fetchNews(with category: Category) {
        articleRepository?.getNews(ammount: 10, page: 1, category: category) { [weak self] result in
            switch result {
                case .success(let articles):
                    self?.presenter?.didFetchNews(articles)
                case .failure(let error):
                    self?.presenter?.didFailFetchingNews(error)
            }
        }
    }
    
}
