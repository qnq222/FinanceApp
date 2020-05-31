//
//  LastOrdersCell.swift
//  FinanceApp
//
//  Created by Ayman  on 5/28/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit

class LastOrdersCell: UITableViewCell {
    
    let cellBackgroundView = UIView()
    let cellImage = UIImageView()
    let cellSupImage = UIImageView()
    let orderName = UILabel()
    let accountType = UILabel()
    let orderDate = UILabel()
    let orderAmount = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier:reuseIdentifier)
        configureCellBackgroundView()
        configureCellImage()
        configureOrderName()
        configureAccountType()
        configureOrderDate()
        configureOrderAmount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellBackgroundView(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.widthToSuperview(offset: -50)
        cellBackgroundView.height(120)
        cellBackgroundView.centerYToSuperview()
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.left(to: contentView , offset: 40)
        cellBackgroundView.layer.cornerRadius = 15
        cellBackgroundView.clipsToBounds = true
    }
    
    func configureCellImage(){
        contentView.addSubview(cellImage)
        cellImage.height(130)
        cellImage.width(130)
        cellImage.left(to: contentView , offset: 5)
        cellImage.top(to: contentView , offset: 20)
        cellImage.addSubview(cellSupImage)
        cellSupImage.width(50)
        cellSupImage.height(50)
        cellSupImage.center(in: cellImage)
       
    }
    
    func configureOrderName(){
        contentView.addSubview(orderName)
        orderName.leftToRight(of: cellImage , offset: 10)
        orderName.text = "Groceries"
        orderName.textColor = UIColor(hexString: "#3A4759")
        orderName.font = UIFont.boldSystemFont(ofSize: 22)
        orderName.top(to: contentView , offset: 40)
        
    }
    
    func configureAccountType(){
        contentView.addSubview(accountType)
        accountType.leftToRight(of: cellImage , offset: 10)
        accountType.text = "Credit card"
        accountType.textColor = UIColor(hexString: "#A6B1C0")
        accountType.font = UIFont.boldSystemFont(ofSize: 15)
        accountType.topToBottom(of: orderName , offset: 5)
        
    }
    
    func configureOrderDate(){
        contentView.addSubview(orderDate)
        orderDate.right(to: contentView , offset: -20)
        orderDate.text = "Today"
        orderDate.textColor = UIColor(hexString: "#A6B1C0")
        orderDate.top(to: contentView , offset:35)
        orderDate.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func configureOrderAmount(){
        contentView.addSubview(orderAmount)
        orderAmount.right(to: contentView , offset: -20)
        orderAmount.text = "$250.00"
        orderAmount.textColor = UIColor(hexString: "#FF958F")
        orderAmount.topToBottom(of: orderDate , offset: 5)
        orderAmount.font = UIFont.boldSystemFont(ofSize: 15)
    }
}
