//
//  CategoriesCollectionViewCell.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import UIKit

// MARK: - View Implementation
class CategoriesCollectionViewCell: UICollectionViewCell, Cell, BaseView {
    
    static let identifier = "CategoriesCollectionViewCell"
    
    let titleLabel = UILabel()
    
    var content: CategoryModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupView()
    }
    
    func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    public func configure(with category: CategoryModel) {
        self.content = category
        titleLabel.text = category.getDisplayTitle()
    }
    
    public func select() {
        contentView.backgroundColor = .lightGrey
    }
    
    public func unselect() {
        contentView.backgroundColor = .lightestGrey
    }
    
}

// MARK: - Setup Subviews Styles
extension CategoriesCollectionViewCell {
    
    func setupStyles() {
        setupViewStyle()
        setupTitleLableStyle()
    }
    
    private func setupViewStyle() {
        backgroundColor = .clear
        contentView.backgroundColor = .lightestGrey
        contentView.layer.cornerRadius = contentView.frame.height / 2
        contentView.layer.masksToBounds = true
    }
    
    private func setupTitleLableStyle() {
        titleLabel.font = .systemFont(ofSize: 12, weight: .light)
        titleLabel.textColor = .darkGrey
    }
    
}

// MARK: - Setup Constraints
extension CategoriesCollectionViewCell {
    
    func setupConstraints() {
        setupTitleLableConstraints()
    }
    
    private func setupTitleLableConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
}
