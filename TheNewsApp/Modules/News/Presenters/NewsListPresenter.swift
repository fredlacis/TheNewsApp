//
//  NewsListPresenter.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import UIKit

// MARK: - Protocols
protocol NewsListPresenter {
    
    var view: NewsListPresenterDelegate? { get set }
    
    var interactor: NewsListInteractor? { get set }
    
    var router: NewsRouter? { get set }
    
    func getHighlights(withCategory category: Category)
    
    func getNews(withCategory category: Category)
    
    func didSelectArticle(_ article: Article)
    
    func getHightlightsCategory() -> Category
    
    func getCategories(excluding excludedCategories: [Category]) -> [Category]
    
}

protocol NewsListPresenterDelegate {
    
    func didUpdateHightlights(_ articles: [Article])
    
    func didFailUpdatingHighlights(_ error: Error?)
    
    func didUpdateNews(_ articles: [Article])
    
    func didFailUpdatingNews(_ error: Error?)
    
}

// MARK: - Presenter Implementation
class NewsListPresenterImplementation: NewsListPresenter {
    
    var view: NewsListPresenterDelegate?
    
    var interactor: NewsListInteractor?
    
    var router: NewsRouter?
    
    func getHighlights(withCategory category: Category) {
        interactor?.fetchHighlights(with: category)
    }
    
    func getNews(withCategory category: Category) {
        interactor?.fetchNews(with: category)
    }
    
    func didSelectArticle(_ article: Article) {
        router?.goToArticleDetails(with: article)
    }
    
    func getHightlightsCategory() -> Category {
        let availableCategories = Category.allCases.filter { $0 != .general }
        return availableCategories.randomElement() ?? .technology
    }
    
    func getCategories(excluding excludedCategories: [Category]) -> [Category] {
        return Category.allCases.sorted { $0 == .general && $1 != .general }.filter { !excludedCategories.contains($0) }
    }
    
}

// MARK: - Presenter Delegate Implementation
extension NewsListPresenterImplementation: NewsListInteractorDelegate {
    
    func didFetchHighlights(_ articles: [Article]) {
        view?.didUpdateHightlights(articles)
    }
    
    func didFailFetchingHighlights(_ error: Error?) {
        view?.didFailUpdatingHighlights(error)
    }
    
    func didFetchNews(_ articles: [Article]) {
        view?.didUpdateNews(articles)
    }
    
    func didFailFetchingNews(_ error: Error?) {
        view?.didFailUpdatingNews(error)
    }
    
}
