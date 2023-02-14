//
//  ScrollableViewController.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

protocol TableViewProtocol {
    func registerNibCells()
}

class ScrollableViewController: BaseViewController, TableViewProtocol {
    var tableView: UITableView!
    var spinner: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerNibCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private
    private func setupView() {
        view.backgroundColor = .white
        
        if tableView == nil {
            // Set up TableView
            tableView = UITableView(frame:view.frame, style: .grouped)
            tableView.delegate = self
            tableView.dataSource = self
            view.addSubview(tableView)
            
            // Set TableView constraint
            if #available(iOS 11.0, *) {
                // Set TableView constraint
                let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
                tableView.translatesAutoresizingMaskIntoConstraints = false
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            }
        }
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.backgroundView = nil
        
        if #available(iOS 11.0, *) {
            tableView.insetsContentViewsToSafeArea = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .automatic
        } else {
            // Fallback on earlier versions
        }
        
        UITableViewCell.registerClass(tableView)
        
    }
    
    
    func registerNibCells() {
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
    }
    
    override func keyBoardWillShow(notification: Notification) {
        super.keyBoardWillShow(notification: notification)
        let userInfoKey = UIResponder.keyboardFrameBeginUserInfoKey
        guard let userInfo = notification.userInfo,
              let keyboardRect = userInfo[userInfoKey] as? CGRect else { return }
        
        let keyboardFrame = self.view.convert(keyboardRect, from: nil)
        self.tableView.contentInset.bottom = keyboardFrame.size.height + 50
    }
    
    override func keyBoardDidHide(notification: Notification) {
        super.keyBoardDidHide(notification: notification)
        let userInfoKey = UIResponder.keyboardFrameBeginUserInfoKey
        guard let userInfo = notification.userInfo,
              let _ = userInfo[userInfoKey] as? CGRect else { return }
        tableView.contentInset.bottom = 0
    }
    
}

// MARK: - Table view data source

extension ScrollableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath) as UITableViewCell
    }
}

extension ScrollableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell.contentView.layoutSubviews()
    }
}
