//
//  CategoriesCollectionView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import UIKit

class CategoriesCollectionView: UICollectionView {
    
    var presenter: NewsListPresenterInputProtocol?
    
    let layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()
        
    var categories: [CategoryModel] = [] {
        didSet {
            self.reloadData()
            DispatchQueue.main.async {
                self.resetSelection()
            }
        }
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    private func setup() {
        register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
    }
    
    private func resetSelection() {
        for row in 0 ..< numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: row, section: 0)
            guard let cell = cellForItem(at: indexPath) as? CategoriesCollectionViewCell else { continue }
            guard cell.content == .none else { continue }
            cell.select()
        }
    }
    
}

// MARK: - UICollectionView Delegate
extension CategoriesCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.getNews(withCategory: categories[indexPath.row])
        unselectAllCells(inSection: indexPath.section)
        if let cell = cellForItem(at: indexPath) as? CategoriesCollectionViewCell {
            cell.select()
        }
    }
    
    private func unselectAllCells(inSection section: Int) {
        for row in 0 ..< numberOfItems(inSection: section) {
            let indexPath = IndexPath(item: row, section: section)
            guard let cell = cellForItem(at: indexPath) as? CategoriesCollectionViewCell else { continue }
            cell.unselect()
        }
    }
    
}

// MARK: - UICollectionView Data Source
extension CategoriesCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else { fatalError("Unable to dequeue reusable CategoriesCollectionViewCell") }
        cell.configure(with: categories[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionView Delegate Flow Layout
extension CategoriesCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellContent = categories[indexPath.row].getDisplayTitle()
        let stringSize = cellContent.size(withAttributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .light)
        ])
        
        return CGSize(width: stringSize.width + 32, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
