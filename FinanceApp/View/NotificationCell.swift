//
//  NotificationCell.swift
//  FinanceApp
//
//  Created by Ayman  on 5/31/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    let cellBackgroundView = UIView()
    let notificationDesc = UILabel()
    let notivicationImage = UIImageView()
    let notificationTime = UILabel()
    let payButton = UIButton(type: .custom)
    let ButtonImage = UIImage(named: "buttonPayBackground")
    let buttonLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier:reuseIdentifier)
        configureCellBackgroundView()
        configureNotificationImage()
        configureNotificationDesc()
        configurePayButton()
        configureNotificationTime()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellBackgroundView(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.width(contentView.frame.width + 80)
        cellBackgroundView.height(100)
        cellBackgroundView.centerXToSuperview()
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.clipsToBounds = true
        cellBackgroundView.layer.cornerRadius = 15
    }
    
    func configureNotificationImage(){
        contentView.addSubview(notivicationImage)
        notivicationImage.left(to: contentView , offset: 15)
        notivicationImage.width(70)
        notivicationImage.height(70)
        notivicationImage.image = UIImage(named: "image")
        notivicationImage.centerYToSuperview()
        notivicationImage.layer.cornerRadius = 35
        notivicationImage.clipsToBounds = true
        
    }
    
    func configureNotificationDesc(){
        contentView.addSubview(notificationDesc)
        notificationDesc.numberOfLines = 0
        notificationDesc.top(to: contentView , offset: 10)
        notificationDesc.leftToRight(of: notivicationImage , offset: 10)
        notificationDesc.width(contentView.frame.size.width - 100)
        notificationDesc.textColor = UIColor(hexString: "#3A4759")
        notificationDesc.text = "You received a payment of $120.00 from Jhon Smith"
    }
    
    func configurePayButton(){
        contentView.addSubview(payButton)
        payButton.leftToRight(of: notificationDesc , offset: -20)
        payButton.width(120)
        payButton.height(60)
        payButton.centerYToSuperview()
        payButton.setImage(ButtonImage, for: .normal)
        buttonLabel.text = "Pay"
        payButton.addSubview(buttonLabel)
        buttonLabel.center(in: payButton)
        buttonLabel.textColor = .white
        
        
    }
    
    func configureNotificationTime(){
        contentView.addSubview(notificationTime)
        notificationTime.topToBottom(of: notificationDesc , offset: 5)
        notificationTime.leftToRight(of: notivicationImage , offset: 10)
        notificationTime.font = UIFont.systemFont(ofSize: 15)
        notificationTime.textColor = UIColor(hexString: "#A6B1C0")
        notificationTime.text = "07:00 AM"
    }
    
}
