//
//  NewsListPresenterTests.swift
//  TheNewsAppTests
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import XCTest
@testable import TheNewsApp

class NewsListPresenterTests: XCTestCase {
    
    var presenter = NewsListPresenter()
    var interactor = NewsListInteractor()
    var view = MockNewsListView()
    
    override func setUp() {
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    func test_get_highlights() {
        interactor.articleRepository = MockArticleRepository()
        
        let callbackExpectation = expectation(description: "update highlights callback is called on presenter delegate")
        view.expectation = callbackExpectation
        
        presenter.getHighlights(withCategory: .general)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_get_highlights_fail() {
        interactor.articleRepository = MockErrorArticleRepository()
        
        let callbackExpectation = expectation(description: "fail updating highlights callback is called on presenter delegate")
        view.expectation = callbackExpectation
        view.currentError = WebService.NetworkError.serverError
        
        presenter.getHighlights(withCategory: .technology)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_get_news() {
        interactor.articleRepository = MockArticleRepository()
        
        let callbackExpectation = expectation(description: "update news callback is called on presenter delegate")
        view.expectation = callbackExpectation
        
        presenter.getNews(withCategory: .general)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_get_news_fail() {
        interactor.articleRepository = MockErrorArticleRepository()
        
        let callbackExpectation = expectation(description: "fail updating news callback is called on presenter delegate")
        view.expectation = callbackExpectation
        view.currentError = WebService.NetworkError.serverError
        
        presenter.getNews(withCategory: .technology)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_get_highlights_category() {
        let category = presenter.getHightlightsCategory()
        XCTAssert(Category.allCases.contains(category))
    }
    
    func test_get_categories_not_excluding() {
        let categories = presenter.getCategories(excluding: [])
        XCTAssertEqual(categories.count, Category.allCases.count)
    }
    
    func test_get_categories_excluding_some() {
        let categories = presenter.getCategories(excluding: [.technology, .business, .general])
        XCTAssertEqual(categories.count, Category.allCases.count - 3)
    }
    
    func test_get_categories_excluding_all() {
        let categories = presenter.getCategories(excluding: Category.allCases)
        XCTAssertEqual(categories.count, 0)
    }
    
}

class MockNewsListView: NewsListPresenterDelegate {
    
    var expectation: XCTestExpectation?
    
    var currentError: Error?
    
    func didUpdateHightlights(_ articles: [ArticleModel]) {
        XCTAssertEqual(articles.count, 2)
        expectation?.fulfill()
    }
    
    func didFailUpdatingHighlights(_ error: Error?) {
        XCTAssertEqual(error?.localizedDescription, currentError?.localizedDescription)
        expectation?.fulfill()
    }
    
    func didUpdateNews(_ articles: [ArticleModel]) {
        XCTAssertEqual(articles.count, 2)
        expectation?.fulfill()
    }
    
    func didFailUpdatingNews(_ error: Error?) {
        XCTAssertEqual(error?.localizedDescription, currentError?.localizedDescription)
        expectation?.fulfill()
    }
    
}
