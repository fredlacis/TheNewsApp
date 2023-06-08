//
//  ArticleDetailsProtocols.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 07/06/23.
//

import Foundation

protocol ArticleDelegate: AnyObject {
    
    var article: ArticleModel? { get set }
    
}

// MARK: - Protocols
protocol ArticleDetailsView {
    
    var delegate: ArticleDelegate? { get }
    
}
