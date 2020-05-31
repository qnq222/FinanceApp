//
//  TopView.swift
//  FinanceApp
//
//  Created by Ayman  on 5/27/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit
import TinyConstraints
class TopView: UIView {
    
    var controllerView = UIView()
    let topViewLabel = UILabel()
    let leftButtonTopView = UIButton(type: .custom)
    let righButtonTopView = UIButton(type: .custom)
    
    init(for controller: UIViewController) {
        super.init(frame: .zero)
        self.controllerView = controller.view
        configureTopView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTopView(){
        controllerView.addSubview(self)
        width(controllerView.frame.width)
        height(120)
        controllerView.top(to: controllerView)
        configureTopViewLabel()
        configureTopViewButtons(button: leftButtonTopView)
        configureTopViewButtons(button: righButtonTopView)
        //configure()
    }
    
    func configureTopViewLabel(){
        controllerView.addSubview(topViewLabel)
        topViewLabel.top(to: controllerView , offset: 70)
        topViewLabel.centerXToSuperview()
        topViewLabel.text = "test"
        
        topViewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        topViewLabel.textColor = .white
    }
    
    func configureTopViewButtons(button:UIButton){
        controllerView.addSubview(button)
        button.top(to: controllerView , offset: 75)
        button.height(20)
        button.width(20)
        switch button {
        case leftButtonTopView:
            let image = UIImage(named: "menuDark")
            button.setImage(image, for: .normal)
            button.left(to: controllerView , offset: 15)
        case righButtonTopView:
            let image = UIImage(named: "nitificationBellDark")
            button.setImage(image, for: .normal)
            button.right(to: controllerView , offset: -15)
        default:
            print("Error")
        }
        
    }
    
    
    
    
}
