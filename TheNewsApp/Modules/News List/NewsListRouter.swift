//
//  NewsRouter.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import UIKit

// MARK: News Router Implementation
class NewsListRouter: NewsListRouterProtocol {
    
    var entryPoint: EntryPoint?
    
    static func start() -> NewsListRouterProtocol {
        let router = NewsListRouter()
        
        let interactor = NewsListInteractor()
        let presenter = NewsListPresenter()
        let view = NewsListView()
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
        
    func routToArticleDetails(with delegate: ArticleDelegate) {
        let articleView = ArticleDetailsViewImplementation()
        articleView.delegate = delegate
        entryPoint?.navigationController?.pushViewController(articleView, animated: true)
    }
    
}
