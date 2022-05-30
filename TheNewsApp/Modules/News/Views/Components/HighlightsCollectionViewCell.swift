//
//  HighlightsCollectionViewCell.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 26/05/22.
//

import UIKit

// MARK: - View Implementation
class HighlightsCollectionViewCell: UICollectionViewCell, Cell, BaseView {
    
    static let identifier = "HighlightsCollectionViewCell"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    var content: Article?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupView()
    }
    
    func configure(with article: Article) {
        self.content = article
        titleLabel.text = article.title
        imageView.image = nil
        imageView.loadFrom(url: article.imageURL)
    }
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
}

// MARK: - Setup Subviews Styles
extension HighlightsCollectionViewCell {
    
    func setupStyles() {
        setupImageViewStyles()
        setupTitleLabelStyles()
    }
    
    private func setupImageViewStyles() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor("#DDDDDD")
    }
    
    private func setupTitleLabelStyles() {
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .darkGrey
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.sizeToFit()
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
}

// MARK: - Setup Constraints
extension HighlightsCollectionViewCell {
    
    func setupConstraints() {
        setupImageViewConstraints()
        setupTitleLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
