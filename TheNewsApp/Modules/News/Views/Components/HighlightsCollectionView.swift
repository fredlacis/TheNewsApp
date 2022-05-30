//
//  HighlightsCollectionView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 26/05/22.
//

import UIKit

// MARK: - View Implementation
class HighlightsCollectionView: UICollectionView {
    
    var presenter: NewsListPresenter?
    
    let layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()
        
    var articles: [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
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
        register(HighlightsCollectionViewCell.self, forCellWithReuseIdentifier: HighlightsCollectionViewCell.identifier)
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
    }
    
}

// MARK: - UICollectionView Delegate
extension HighlightsCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectArticle(articles[indexPath.row])
    }
    
}

// MARK: - UICollectionView Data Source
extension HighlightsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: HighlightsCollectionViewCell.identifier, for: indexPath) as? HighlightsCollectionViewCell else { fatalError("Unable to dequeue reusable HighlightsCollectionViewCell") }
        cell.configure(with: articles[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionView Delegate Flow Layout
extension HighlightsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.34, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
