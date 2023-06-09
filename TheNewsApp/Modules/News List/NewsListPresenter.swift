//
//  NewsListPresenter.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import UIKit

// MARK: - Presenter Input
class NewsListPresenter: NewsListPresenterInputProtocol, ArticleDelegate {
    
    var view: NewsListViewProtocol?
    var interactor: NewsListInteractorProtocol?
    var router: NewsListRouterProtocol?
    
    var article: ArticleModel?
    
    func getHighlights(withCategory category: CategoryModel) {
        interactor?.fetchHighlights(with: category)
    }
    
    func getNews(withCategory category: CategoryModel) {
        interactor?.fetchNews(with: category)
    }
    
    func didSelectArticle(_ article: ArticleModel) {
        self.article = article
        router?.routToArticleDetails(with: self)
    }
    
    func getHighlightsCategory() -> CategoryModel {
        let availableCategories = CategoryModel.allCases.filter { $0 != .general }
        return availableCategories.randomElement() ?? .technology
    }
    
    func getCategories(excluding excludedCategories: [CategoryModel]) -> [CategoryModel] {
        return CategoryModel.allCases
            .sorted { $0 == .general && $1 != .general }
            .filter { !excludedCategories.contains($0) }
    }
    
}

// MARK: - Presenter Output
extension NewsListPresenter: NewsListPresenterOutputProtocol {
    
    func didFetchHighlights(_ articles: [ArticleModel]) {
        view?.updateHighlights(articles)
    }
    
    func didFailFetchingHighlights(_ error: Error?) {
        view?.failUpdatingHighlights(error)
    }
    
    func didFetchNews(_ articles: [ArticleModel]) {
        view?.updateNews(articles)
    }
    
    func didFailFetchingNews(_ error: Error?) {
        view?.failUpdatingNews(error)
    }
    
}
