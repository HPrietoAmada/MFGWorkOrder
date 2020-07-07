//
//  WorkOrderModelTableViewController+TableView.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension WorkOrderModelTableViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workOrderModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BasicTableViewCell
        let workOrder = workOrderModels[indexPath.row].model ?? ""
        cell.topLeftLabel.text = workOrder
        cell.bottomLeftLabel.text = workOrderType.type ?? ""
        cell.bottomRightLabel.text = Date().formatted()
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workOrderModel = workOrderModels[indexPath.row]
        let controller = WorkOrdersTableViewController()
        controller.workOrderModel = workOrderModel
        navigationController?.pushViewController(controller, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! HeaderTableViewCell
        header.titleLabel.text = workOrderType.type ?? ""
        header.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        if workOrderModels.count == 0 {
            header.subtitleLabel.text = "No work orders have been added."
        } else {
            header.subtitleLabel.text = "\(workOrderModels.count) result(s) found"
        }
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

}
