//
//  Category.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 26/05/22.
//

import Foundation

enum CategoryModel: String, CaseIterable {
    
    case general
    case business
    case health
    case science
    case sports
    case technology
    
    func getDisplayTitle() -> String {
        switch self {
            case .business:
                return "Negócios"
            case .general:
                return "Geral"
            case .health:
                return "Saúde"
            case .science:
                return "Ciência"
            case .sports:
                return "Esportes"
            case .technology:
                return "Tecnologia"
        }
    }
    
}
