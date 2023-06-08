//
//  NewsListTableView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import UIKit

// MARK: - View Implementation
class NewsListTableView: UITableView {
    
    var presenter: NewsListPresenterInputProtocol?
    
    var articles: [ArticleModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    init() {
        super.init(frame: .zero, style: .plain)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero, style: .plain)
        setup()
    }
    
    private func setup() {
        register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.identifier)
        separatorColor = .clear
        backgroundColor = .clear
        isScrollEnabled = false
        dataSource = self
        delegate = self
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
    
}

// MARK: - UITableView Data Source
extension NewsListTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath) as? NewsListTableViewCell else { fatalError("Unable to dequeue reusable NewsListTableViewCell") }
        cell.configure(with: articles[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: - UITableView Delegate
extension NewsListTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectArticle(articles[indexPath.row])
    }
    
}
