//
//  Cell.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import Foundation

protocol Cell {
    
    associatedtype CellCotent
    
    static var identifier: String { get }
    
    var content: CellCotent? { get set }
    
    func configure(with content: CellCotent)
    
}
