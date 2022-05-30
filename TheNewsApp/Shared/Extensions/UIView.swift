//
//  UIView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import UIKit

extension UIView {
    
    static func circularView(withDiameter diameter: CGFloat, color: UIColor = .neutral) -> UIView {
        
        let view = UIView()
        view.layer.cornerRadius = diameter / 2
        view.layer.masksToBounds = true
        view.backgroundColor = color
        view.widthAnchor.constraint(equalToConstant: diameter).isActive = true
        view.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        return view
        
    }
    
}
