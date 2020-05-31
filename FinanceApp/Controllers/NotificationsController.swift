//
//  NotificationsControllers.swift
//  FinanceApp
//
//  Created by Ayman  on 5/27/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {
    
    var topView: TopView!
    let viewTableView = UIView()
    let notificationTableView = UITableView()
    let notificationCellIdentifier = "notificationCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#24282E")
        
        topView = TopView(for: self)
        topView.topViewLabel.text = "Notifications"
        configureViewTableView()
    }
    
    func configureViewTableView(){
        view.addSubview(viewTableView)
        viewTableView.width(view.frame.width)
        viewTableView.height(view.frame.height)
        viewTableView.topToBottom(of: topView , offset: 20)
        configureNotificationTableView()
    }
    
    func configureNotificationTableView(){
        viewTableView.addSubview(notificationTableView)
        notificationTableView.pinTableView(to: viewTableView)
        notificationTableView.register(NotificationCell.self, forCellReuseIdentifier: notificationCellIdentifier)
        notificationTableView.separatorStyle = .none
        notificationTableView.backgroundColor = .clear
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
    }
    
    @objc func payButtonPressed(){
        print("pay")
    }
}

extension NotificationsController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCellIdentifier, for: indexPath) as! NotificationCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.payButton.addTarget(self, action: #selector(payButtonPressed), for: .touchUpInside)
        return cell
    }
    
}
