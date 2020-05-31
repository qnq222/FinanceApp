//
//  Constraints.swift
//  FinanceApp
//
//  Created by Ayman  on 5/28/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit

extension UIView{
    func pinTableView (to superView:UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor ,constant: -20).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
}
