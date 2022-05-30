//
//  Date.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 28/05/22.
//

import Foundation

extension Date {
    
    static func fromISOString(_ string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: string)
    }
    
    func formatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
    
}
