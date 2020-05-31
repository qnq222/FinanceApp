//
//  ViewController.swift
//  FinanceApp
//
//  Created by Ayman  on 5/27/20.
//  Copyright © 2020 Ayman . All rights reserved.
//

import UIKit

class DashBoardController: UIViewController {
    
    var topView: TopView!
    let listOfAccountsView = UIView()
    let listOfAccountLB = UILabel()
    var listOfAccountsStack = UIStackView()
    //
    let bankView = UIImageView()
    let bankLB = UILabel()
    let bankBalance = UILabel()
    let creditView = UIImageView()
    let creditLB = UILabel()
    let creditBalance = UILabel()
    let cashView = UIImageView()
    let cashLb = UILabel()
    let cashBalance = UILabel()
    //
    let totalBalanceView = UIView()
    let totalBalanceViewBack = UIView()
    let totalBalanceCash = UILabel()
    let totalBalanceLB = UILabel()
    //
    let lastOrdersView = UIView()
    let lastOrdersLB = UILabel()
    let lastOrdersViewTableView = UIView()
    let lastOrdersTableView = UITableView()
    
    let cellIdentifier = "lastOrderCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#F2F4F7")
        configureTopView()
        configureListOfAccountsView()
        configureTotalBalanceView()
        configureLastOrdersView()
    }
    
    func configureTopView(){
        topView = TopView(for: self)
        topView.topViewLabel.text = "Dashboard"
        topView.leftButtonTopView.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        topView.righButtonTopView.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
    }
    
    @objc func leftButtonPressed(){
        //TODO: for later.
        print("")
    }
    
    @objc func rightButtonPressed(){
        print("Notification")
        let notificationVC = NotificationsController()
        //notificationVC.modalPresentationStyle = .fullScreen
        self.present(notificationVC, animated: true, completion: nil)
    }
    
    func configureListOfAccountsView(){
        view.addSubview(listOfAccountsView)
        listOfAccountsView.width(view.frame.width)
        listOfAccountsView.height(130)
        listOfAccountsView.topToBottom(of: topView , offset: 30)
        //
        
        listOfAccountsView.addSubview(listOfAccountLB)
        listOfAccountLB.left(to: listOfAccountsView , offset: 10)
        listOfAccountLB.text = "List of Account"
        listOfAccountLB.font = UIFont.boldSystemFont(ofSize: 20)
        listOfAccountLB.textColor = UIColor(hexString: "#3A4759")
        
        
        configureView(view: bankView, image: "bankBackground", label: bankLB, balance: bankBalance)
        configureView(view: creditView, image: "creditBackground" , label: creditLB, balance: creditBalance)
        configureView(view: cashView, image: "cashBackground" , label: cashLb, balance: cashBalance)
        
        configureStackView()
    }
    
    func configureView(view:UIImageView , image: String , label:UILabel , balance: UILabel){
        view.width(150)
        view.height(110)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.image = UIImage(named: image)
        view.addSubview(label)
        label.centerXToSuperview()
        label.top(to: view , offset: 15)
        label.textColor = .white
        view.addSubview(balance)
        balance.topToBottom(of: label , offset: 3)
        balance.textColor = .white
        balance.centerXToSuperview()
        switch view {
        case bankView:
            label.text = "Bank Account"
            balance.text = "$2500.00"
        case creditView:
            label.text = "Credit card"
            balance.text = "$1500.00"
        case cashView:
            label.text = "Cash"
            balance.text = "800.00"
        default:
            print("Error")
        }
        
    }
    
    func configureStackView(){
        listOfAccountsStack = UIStackView(arrangedSubviews: [bankView , creditView , cashView])
        listOfAccountsStack.axis = .horizontal
        listOfAccountsStack.spacing = -15
        listOfAccountsView.addSubview(listOfAccountsStack)
        listOfAccountsStack.topToBottom(of: listOfAccountLB , offset: 10)
        listOfAccountsStack.centerXToSuperview()
        
    }
    
    func configureTotalBalanceView(){
        view.addSubview(totalBalanceViewBack)
        totalBalanceViewBack.width(view.frame.width - 60)
        totalBalanceViewBack.height(140)
        totalBalanceViewBack.topToBottom(of: listOfAccountsView , offset: 35)
        totalBalanceViewBack.backgroundColor = UIColor(hexString: "#D6D5D5")
        totalBalanceViewBack.alpha = 0.5
        totalBalanceViewBack.centerXToSuperview()
        totalBalanceViewBack.layer.cornerRadius = 12
        totalBalanceViewBack.clipsToBounds = true
        
        view.addSubview(totalBalanceView)
        totalBalanceView.width(view.frame.width - 30)
        totalBalanceView.height(140)
        totalBalanceView.topToBottom(of: listOfAccountsView , offset: 20)
        totalBalanceView.backgroundColor = UIColor(hexString: "#fff")
        totalBalanceView.centerXToSuperview()
        totalBalanceView.layer.cornerRadius = 12
        totalBalanceView.clipsToBounds = true
        
        configureTotalBalanceLabels()
    }
    
    func configureTotalBalanceLabels(){
        totalBalanceView.addSubview(totalBalanceCash)
        totalBalanceCash.centerXToSuperview()
        totalBalanceCash.top(to: totalBalanceView , offset: 20)
        totalBalanceCash.text = "$4800.00"
        totalBalanceCash.font = UIFont.boldSystemFont(ofSize: 35)
        totalBalanceCash.textColor = UIColor(hexString: "#FF958F")
        
        //
        
        totalBalanceView.addSubview(totalBalanceLB)
        totalBalanceLB.centerXToSuperview()
        totalBalanceLB.topToBottom(of: totalBalanceCash , offset: 5)
        totalBalanceLB.text = "Total Balance"
        totalBalanceLB.font = UIFont.boldSystemFont(ofSize: 20)
        totalBalanceLB.textColor = UIColor(hexString: "#A6B1C0")
        
    }
    
    func configureLastOrdersView(){
        view.addSubview(lastOrdersView)
        lastOrdersView.topToBottom(of: totalBalanceViewBack , offset: 20)
        lastOrdersView.width(view.frame.width)
        lastOrdersView.height(400)
        //
        lastOrdersView.addSubview(lastOrdersLB)
        lastOrdersLB.left(to: lastOrdersView , offset: 10)
        lastOrdersLB.text = "Last Records Overview"
        lastOrdersLB.textColor = UIColor(hexString: "#3A4759")
        lastOrdersLB.font = UIFont.boldSystemFont(ofSize: 20)
        //
        configureViewTableView()
    }
    
    func configureViewTableView(){
        lastOrdersView.addSubview(lastOrdersViewTableView)
        lastOrdersViewTableView.topToBottom(of: lastOrdersLB , offset: 10)
        lastOrdersViewTableView.height(350)
        lastOrdersViewTableView.width(view.frame.width)
        
        configureTableView()
    }
    
    func configureTableView(){
        lastOrdersViewTableView.addSubview(lastOrdersTableView)
        lastOrdersTableView.register(LastOrdersCell.self, forCellReuseIdentifier: cellIdentifier)
        lastOrdersTableView.pinTableView(to: lastOrdersViewTableView)
        lastOrdersTableView.separatorStyle = .none
        lastOrdersTableView.backgroundColor = .clear
        lastOrdersTableView.delegate = self
        lastOrdersTableView.dataSource = self
    }
    
}

extension DashBoardController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LastOrdersCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell.orderName.text = "Groceries"
        case 1:
            cell.orderName.text = "Clothes"
        case 2:
            cell.orderName.text = "Rental"
            
        default:
            print("Error")
        }
        switch cell.orderName.text {
        case "Groceries":
            cell.cellImage.image = UIImage(named: "cellBackgroundOne")
            cell.cellSupImage.image = UIImage(named: "cellSup")
            cell.orderAmount.textColor = UIColor(hexString: "#FF958F")
        case "Clothes":
            cell.cellImage.image = UIImage(named: "cellBackgroundTwo")
            cell.cellSupImage.image = UIImage(named: "cellSupTwo")
            cell.orderAmount.textColor = UIColor(hexString: "#A254F2")
        case "Rental":
            cell.cellImage.image = UIImage(named: "cellBackgroundThree")
            cell.cellSupImage.image = UIImage(named: "cellSupThree")
            cell.orderAmount.textColor = UIColor(hexString: "#51EFDE")
        default:
            print("Error Image")
        }
        return cell
    }
    
}

