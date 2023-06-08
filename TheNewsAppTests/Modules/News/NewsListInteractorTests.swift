//
//  NewsListInteractorTests.swift
//  TheNewsAppTests
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import XCTest
@testable import TheNewsApp

class NewsListInteractorTests: XCTestCase {
    
    var interactor: NewsListInteractorProtocol = NewsListInteractor()
    var presenter = MockNewsListPresenter()
    
    override func setUp() {
        interactor.presenter = presenter
    }
    
    func test_fetch_highlights() {
        let callbackExpectation = expectation(description: "fetch highlights callback is called on interactor delegate")
        presenter.expectation = callbackExpectation
        interactor.articleRepository = MockArticleRepository()
        interactor.fetchHighlights(with: .general)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_fetch_highlights_error() {
        let callbackExpectation = expectation(description: "fail fetching highlights callback is called on interactor delegate")
        presenter.expectation = callbackExpectation
        interactor.articleRepository = MockErrorArticleRepository()
        presenter.currentError = WebService.NetworkError.serverError
        interactor.fetchHighlights(with: .general)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_fetch_news() {
        let callbackExpectation = expectation(description: "fetch news callback is called on interactor delegate")
        presenter.expectation = callbackExpectation
        interactor.articleRepository = MockArticleRepository()
        interactor.fetchNews(with: .entertainment)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
    func test_fetch_news_error() {
        let callbackExpectation = expectation(description: "fail fetching news callback is called on interactor delegate")
        presenter.expectation = callbackExpectation
        interactor.articleRepository = MockErrorArticleRepository()
        presenter.currentError = WebService.NetworkError.serverError
        interactor.fetchNews(with: .general)
        wait(for: [callbackExpectation], timeout: 60)
    }
    
}

class MockNewsListPresenter: NewsListPresenterOutputProtocol {
    
    var expectation: XCTestExpectation?
    
    var currentError: Error?
    
    func didFetchHighlights(_ articles: [ArticleModel]) {
        XCTAssertEqual(articles.count, 2)
        expectation?.fulfill()
    }
    
    func didFailFetchingHighlights(_ error: Error?) {
        XCTAssertEqual(error?.localizedDescription, currentError?.localizedDescription)
        expectation?.fulfill()
    }
    
    func didFetchNews(_ articles: [ArticleModel]) {
        XCTAssertEqual(articles.count, 2)
        expectation?.fulfill()
    }
    
    func didFailFetchingNews(_ error: Error?) {
        XCTAssertEqual(error?.localizedDescription, currentError?.localizedDescription)
        expectation?.fulfill()
    }
    
}
