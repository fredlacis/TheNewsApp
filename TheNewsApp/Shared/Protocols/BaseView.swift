//
//  BaseView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 26/05/22.
//

import Foundation

protocol BaseView {
    
    func setupView()
    func addSubviews()
    func setupStyles()
    func setupConstraints()
    
}

extension BaseView {
    
    func setupView() {
        addSubviews()
        setupStyles()
        setupConstraints()
    }
    
}
