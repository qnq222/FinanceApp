//
//  GradientColor.swift
//  FinanceApp
//
//  Created by Ayman  on 5/27/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit

extension UIView {

    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            sublayers.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }

        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
