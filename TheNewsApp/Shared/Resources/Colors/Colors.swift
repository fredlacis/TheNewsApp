//
//  Colors.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 29/05/22.
//

import UIKit

extension UIColor {
    
    /// HEX: #FFFFFF
    static var neutral: UIColor {
        return UIColor(named: "neutral") ?? UIColor("#FFFFFF")
    }
    
    /// HEX: #D9D9D9
    static var lightestGrey: UIColor {
        return UIColor(named: "lightestGrey") ?? UIColor("#D9D9D9")
    }
    
    /// HEX: #BABABA
    static var lightGrey: UIColor {
        return UIColor(named: "lightGrey") ?? UIColor("#BABABA")
    }
    
    /// HEX: #747474
    static var mediumGrey: UIColor {
        return UIColor(named: "mediumGrey") ?? UIColor("#747474")
    }
    
    /// HEX: #202020
    static var darkGrey: UIColor {
        return UIColor(named: "darkGrey") ?? UIColor("#202020")
    }
    
}
