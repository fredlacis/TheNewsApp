//
//  UIImageView.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 27/05/22.
//

import UIKit

extension UIImageView {
    
    func loadFrom(url: String, withJPEGQuality jpegQuality: CGFloat = 0.5) {
        let webService = WebService()
        
        webService.getImage(from: url) { result in
            switch result {
            case .success(let image):
                guard let compressedData = image.jpegData(compressionQuality: jpegQuality),
                       let compressedImage = UIImage(data: compressedData) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.image = compressedImage
                }
            case .failure(_):
                return
            }
        }
    }
    
}
