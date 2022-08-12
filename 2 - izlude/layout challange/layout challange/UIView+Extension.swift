//
//  UIView+Extension.swift
//  layout challange
//
//  Created by Fahri Novaldi on 12/08/22.
//

import UIKit

extension UIView {
    func applyGradient(with color: [CGColor], start from: CGPoint, to this: CGPoint) {
        let gradient = CAGradientLayer()
        gradient.colors = color
        gradient.startPoint = from
        gradient.endPoint = this
        gradient.frame = self.bounds
        gradient.cornerRadius = self.layer.cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
        print("apply")
//        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
