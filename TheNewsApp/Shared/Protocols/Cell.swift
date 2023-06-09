//
//  Cell.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import Foundation

protocol Cell {
    
    associatedtype CellContent
    
    static var identifier: String { get }
    
    var content: CellContent? { get set }
    
    func configure(with content: CellContent)
    
}
