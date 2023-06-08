//
//  ArticleDetailsView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 25/05/22.
//

import UIKit

// MARK: - View Implementation
class ArticleDetailsViewImplementation: UIViewController, ArticleDetailsView, BaseView {
    
    var article: ArticleModel
    
    let heroImageView = UIImageView()
    let detailsView = UIView()
    let authorNameLabel = UILabel()
    let publicationDateLabel = UILabel()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    
    init(article: ArticleModel) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    func addSubviews() {
        view.addSubview(heroImageView)
        view.addSubview(detailsView)
        detailsView.addSubview(authorNameLabel)
        detailsView.addSubview(publicationDateLabel)
        detailsView.addSubview(titleLabel)
        detailsView.addSubview(contentLabel)
    }

}

// MARK: - Setup Subviews Styles
extension ArticleDetailsViewImplementation {
    
    func setupStyles() {
        setupViewStyles()
        setupHeroImageViewStyle()
        setupDetailsViewStyle()
        setupAuthorNameLabelStyle()
        setupPublicationDateLabelStyle()
        setupTitleLabelStyle()
        setupContentLabelStyle()
    }
    
    private func setupViewStyles() {
        view.backgroundColor = .neutral
    }
    
    private func setupHeroImageViewStyle() {
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.backgroundColor = UIColor("#DDDDDD")
        heroImageView.loadFrom(url: article.imageURL)
    }
    
    private func setupDetailsViewStyle() {
        detailsView.backgroundColor = .neutral
        detailsView.layer.cornerRadius = 8
        detailsView.layer.masksToBounds = true
    }
    
    private func setupAuthorNameLabelStyle() {
        authorNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        authorNameLabel.textColor = .mediumGrey
        authorNameLabel.text = article.authorName
    }
    
    private func setupPublicationDateLabelStyle() {
        publicationDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        publicationDateLabel.textColor = .mediumGrey
        publicationDateLabel.text = article.publicationDate.formatted()
    }
    
    private func setupTitleLabelStyle() {
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = .darkGrey
        titleLabel.numberOfLines = 0
        titleLabel.text = article.title
    }
    
    private func setupContentLabelStyle() {
        contentLabel.font = .systemFont(ofSize: 12, weight: .regular)
        contentLabel.textColor = .darkGrey
        contentLabel.numberOfLines = 0
        contentLabel.text = article.content
    }
    
}

// MARK: - Setup Constraints
extension ArticleDetailsViewImplementation {
    
    func setupConstraints() {
        setupHeroImageViewConstraints()
        setupDetailsViewConstraints()
        setupAuthorNameLabelConstraints()
        setupPublicationDateLabelConstraints()
        setupTitleLabelConstraints()
        setupContentLabelConstraints()
    }
    
    private func setupHeroImageViewConstraints() {
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: view.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            heroImageView.heightAnchor.constraint(equalTo: heroImageView.widthAnchor, multiplier: 0.65),
        ])
    }
    
    private func setupDetailsViewConstraints() {
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: -8.0),
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupAuthorNameLabelConstraints() {
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorNameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 16),
            authorNameLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
        ])
    }
    
    private func setupPublicationDateLabelConstraints() {
        publicationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            publicationDateLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 16),
            publicationDateLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupContentLabelConstraints() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -16),
        ])
    }
    
}
