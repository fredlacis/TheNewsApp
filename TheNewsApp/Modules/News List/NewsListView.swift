//
//  NewsListView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import UIKit

// MARK: - View Implementation
class NewsListView: UIViewController, NewsListViewProtocol, BaseView {
    
    var presenter: NewsListPresenterInputProtocol?
    
    var highlightsCategory: CategoryModel?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let highlightsTitleLabel = UILabel()
    let highlightsArticlesCollectionView = HighlightsCollectionView()
    
    let newsTitleLabel = UILabel()
    let newsCategoriesCollectionView = CategoriesCollectionView()
    let newsListTableView = NewsListTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highlightsArticlesCollectionView.presenter = presenter
        newsCategoriesCollectionView.presenter = presenter
        newsListTableView.presenter = presenter
        
        if let category = presenter?.getHighlightsCategory(),
           let categories = presenter?.getCategories(excluding: [category]){
            highlightsCategory = category
            presenter?.getHighlights(withCategory: category)
            
            newsCategoriesCollectionView.categories = categories
            presenter?.getNews(withCategory: .general)
        }
        
        scrollView.delegate = self
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(highlightsTitleLabel)
        contentView.addSubview(highlightsArticlesCollectionView)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(newsCategoriesCollectionView)
        contentView.addSubview(newsListTableView)
    }
    
}

// MARK: - Update Events
extension NewsListView {
    
    func updateHighlights(_ articles: [ArticleModel]) {
        highlightsArticlesCollectionView.articles = articles
    }
    
    func failUpdatingHighlights(_ error: Error?) {
        // TODO: Proper error handling
    }
    
    func updateNews(_ articles: [ArticleModel]) {
        newsListTableView.articles = articles
    }
    
    func failUpdatingNews(_ error: Error?) {
        // TODO: Proper error handling
    }
    
}

// MARK: - Setup Subviews Styles
extension NewsListView {
    
    func setupStyles() {
        setupViewStyles()
        setupScrollViewStyle()
        setupHighlightsTitleLabelStyles()
        setupNewsTitleLabelStyles()
        setupNewsListTableViewStyles()
    }
    
    private func setupViewStyles() {
        view.backgroundColor = .neutral
    }
    
    private func setupScrollViewStyle() {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setupHighlightsTitleLabelStyles() {
        highlightsTitleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        highlightsTitleLabel.textColor = .darkGrey
        highlightsTitleLabel.text = "Destaques em \(highlightsCategory?.getDisplayTitle() ?? "")"
    }
    
    private func setupNewsTitleLabelStyles() {
        newsTitleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        newsTitleLabel.textColor = .darkGrey
        newsTitleLabel.text = "Novidades"
    }
    
    private func setupNewsListTableViewStyles() {
        
    }
    
}

// MARK: - Setup Constraints
extension NewsListView {
    
    func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupHighlightsTitleLabelConstraints()
        setupHighlightsArticlesCollectionViewConstraints()
        setupNewsTitleLabelConstraints()
        setupNewsCategoriesCollectionViewConstraints()
        setupNewsListTableViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupHighlightsTitleLabelConstraints() {
        highlightsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highlightsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64),
            highlightsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            highlightsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupHighlightsArticlesCollectionViewConstraints() {
        highlightsArticlesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highlightsArticlesCollectionView.topAnchor.constraint(equalTo: highlightsTitleLabel.bottomAnchor, constant: 16),
            highlightsArticlesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            highlightsArticlesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            highlightsArticlesCollectionView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45),
        ])
    }
    
    private func setupNewsTitleLabelConstraints() {
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: highlightsArticlesCollectionView.bottomAnchor, constant: 32),
            newsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupNewsCategoriesCollectionViewConstraints() {
        newsCategoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsCategoriesCollectionView.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 16),
            newsCategoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsCategoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsCategoriesCollectionView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.058),
        ])
    }
    
    private func setupNewsListTableViewConstraints() {
        newsListTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsListTableView.topAnchor.constraint(equalTo: newsCategoriesCollectionView.bottomAnchor, constant: 16),
            newsListTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsListTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            newsListTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
}

// MARK: - Scroll View Delegate
extension NewsListView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.convert(newsTitleLabel.frame.origin, to: self.view).y <= 60 {
            navigationController?.navigationBar.topItem?.title = newsTitleLabel.text
        } else if scrollView.convert(highlightsTitleLabel.frame.origin, to: self.view).y <= 60 {
            navigationController?.navigationBar.topItem?.title = highlightsTitleLabel.text
        } else {
            navigationController?.navigationBar.topItem?.title = ""
        }
    }
    
}
