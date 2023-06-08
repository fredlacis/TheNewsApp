//
//  NewsListProtocols.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 07/06/23.
//

import UIKit

// MARK: - View
protocol NewsListViewProtocol {
    
    var presenter: NewsListPresenterInputProtocol? { get set }
    
    func updateHighlights(_ articles: [ArticleModel])
    
    func failUpdatingHighlights(_ error: Error?)
    
    func updateNews(_ articles: [ArticleModel])
    
    func failUpdatingNews(_ error: Error?)
    
}

// MARK: - Interactor
protocol NewsListInteractorProtocol {
    
    var presenter: NewsListPresenterOutputProtocol? { get set }
    
    var articleRepository: ArticleRepository? { get set }
    
    func fetchHighlights(with category: CategoryModel)
    
    func fetchNews(with category: CategoryModel)
    
}

// MARK: - Presenter
typealias NewsListPresenterProtocol = NewsListPresenterInputProtocol & NewsListPresenterOutputProtocol

protocol NewsListPresenterInputProtocol {
    
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorProtocol? { get set }
    var router: NewsListRouterProtocol? { get set }
    
    func getHighlights(withCategory category: CategoryModel)
    
    func getNews(withCategory category: CategoryModel)
    
    func didSelectArticle(_ article: ArticleModel)
    
    func getHighlightsCategory() -> CategoryModel
    
    func getCategories(excluding excludedCategories: [CategoryModel]) -> [CategoryModel]
    
}

protocol NewsListPresenterOutputProtocol {
    
    func didFetchHighlights(_ articles: [ArticleModel])
    
    func didFailFetchingHighlights(_ error: Error?)
    
    func didFetchNews(_ articles: [ArticleModel])
    
    func didFailFetchingNews(_ error: Error?)
    
}

// MARK: - Router
protocol NewsListRouterProtocol {
    
    typealias EntryPoint = NewsListViewProtocol & UIViewController
    
    var entryPoint: EntryPoint? { get }
    
    static func start() -> NewsListRouterProtocol    
    
    func routToArticleDetails(with delegate: ArticleDelegate)
    
}
