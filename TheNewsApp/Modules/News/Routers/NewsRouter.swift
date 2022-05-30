//
//  NewsRouter.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import UIKit

// MARK: - Protocols
protocol NewsRouter {
    
    typealias EntryPoint = NewsListView & UIViewController
    
    static func start() -> NewsRouter
    
    var entryPoint: EntryPoint? { get }
    
    func goToArticleDetails(with article: Article)
    
}

// MARK: News Router Implementation
class NewsRouterImplementation: NewsRouter {
    
    var entryPoint: EntryPoint?
    
    static func start() -> NewsRouter {
        let router = NewsRouterImplementation()
        
        let interactor = NewsListInteractorImplementation()
        let presenter = NewsListPresenterImplementation()
        let view = NewsListViewImplementation()
        let articleRepository = ArticleNewsAPIRepository()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.articleRepository = articleRepository
        
        router.entryPoint = view
        
        return router
    }
        
    func goToArticleDetails(with article: Article) {
        let articleView = ArticleDetailsViewImplementation(article: article)
        entryPoint?.navigationController?.pushViewController(articleView, animated: true)
    }
    
}
