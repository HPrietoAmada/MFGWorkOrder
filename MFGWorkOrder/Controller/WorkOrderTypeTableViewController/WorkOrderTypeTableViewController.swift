//
//  WorkOrderTypeTableViewController.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

class WorkOrderTypeTableViewController: UIViewController {

    let cellId: String = "cell-id"
    let headerId: String = "header-cell"

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        setupTableView()
        if let navController = navigationController, let topItem = navController.navigationBar.topItem {
             topItem.title = ""
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navController = navigationController, let topItem = navController.navigationBar.topItem {
             topItem.title = ""
        }
    }

    func setup() {
        view.backgroundColor = .white

        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scan QR Code", style: .plain, target: self, action: #selector(handleAdd))
        }

        @objc func handleAdd() {
            let controller = QRScannerViewController()
            present(controller, animated: true, completion: nil)
        }
}
