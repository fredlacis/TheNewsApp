//
//  NewsListTableViewCell.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import UIKit

// MARK: - View Implementation
class NewsListTableViewCell: UITableViewCell, Cell, BaseView {
    
    static let identifier = "NewsListTableViewCell"
    
    let articleImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    let infoStackView = UIStackView()
    let publishedDateLabel = UILabel()
    let authorNameLabel = UILabel()
    
    var content: Article?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(style: .default, reuseIdentifier: NewsListTableViewCell.identifier)
        setupView()
    }
    
    func configure(with content: Article) {
        self.content = content
        articleImageView.loadFrom(url: content.imageURL)
        titleLabel.text = content.title
        descriptionLabel.text = content.description
        publishedDateLabel.text = content.publicationDate.formatted()
        authorNameLabel.text = content.authorName
    }
    
    func addSubviews() {
        contentView.addSubview(articleImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        infoStackView.addArrangedSubview(publishedDateLabel)
        infoStackView.addArrangedSubview(.circularView(withDiameter: 3, color: .mediumGrey))
        infoStackView.addArrangedSubview(authorNameLabel)
        contentView.addSubview(infoStackView)
    }
    
}

// MARK: - Setup Subviews Styles
extension NewsListTableViewCell {
    
    func setupStyles() {
        setupViewStyle()
        setupArticleImageViewStyle()
        setupTitleLabelStyle()
        setupDescriptionLabelStyle()
        setupInfoStackViewStyle()
        setupPublishedDateLabelStyle()
        setupAuthorNameLabelStyle()
    }
    
    private func setupViewStyle() {
        backgroundColor = .clear
    }
    
    private func setupArticleImageViewStyle() {
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.layer.cornerRadius = 4
        articleImageView.layer.masksToBounds = true
        articleImageView.backgroundColor = .lightestGrey
    }
    
    private func setupTitleLabelStyle() {
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = .darkGrey
        titleLabel.numberOfLines = 0
    }
    
    private func setupDescriptionLabelStyle() {
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = .darkGrey
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupInfoStackViewStyle() {
        infoStackView.axis = .horizontal
        infoStackView.spacing = 5
        infoStackView.alignment = .center
    }
    
    private func setupPublishedDateLabelStyle() {
        publishedDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        publishedDateLabel.textColor = .mediumGrey
    }
    
    private func setupAuthorNameLabelStyle() {
        authorNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        authorNameLabel.textColor = .mediumGrey
    }
    
}

// MARK: - Setup Constraints
extension NewsListTableViewCell {
    
    func setupConstraints() {
        setupArticleImageViewConstraints()
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
        setupInfoStackViewConstraints()
    }
    
    private func setupArticleImageViewConstraints() {
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            articleImageView.heightAnchor.constraint(equalTo: articleImageView.widthAnchor, multiplier: 0.5),
        ])
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func setupInfoStackViewConstraints() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoStackView.heightAnchor.constraint(equalToConstant: 12),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
    }
    
}
