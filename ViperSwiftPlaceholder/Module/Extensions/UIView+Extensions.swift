//
//  UIView+Extensions.swift
//  ViperSwiftPlaceholder
//
//  Created by Mahmut Gazi Doğan on 11.10.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
    func addArrangedSubviews(_ stackViews: UIView...) {
        stackViews.forEach {
            self.addArrangedSubviews($0)
        }
    }
}
