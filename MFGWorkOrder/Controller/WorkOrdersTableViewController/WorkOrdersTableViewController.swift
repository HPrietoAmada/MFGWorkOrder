//
//  WorkOrdersTableViewController.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

class WorkOrdersTableViewController: UIViewController {

    var workOrderModel: WorkOrderModel = WorkOrderModel() {
        didSet {
            workOrders = WorkOrderFile().getFiles().filter({ $0.modelId == workOrderModel.id })
        }
    }

    var workOrders: [WorkOrderFile] = [WorkOrderFile]() {
        didSet {
            tableView.reloadData()
        }
    }

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
        
    }

    func setup() {
        view.backgroundColor = .white

        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        if let navigationController = navigationController {
            navigationController.navigationBar.topItem?.title = workOrderModel.model ?? ""
        }
    }
}
