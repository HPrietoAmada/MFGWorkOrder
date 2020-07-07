//
//  WorkOrdersTableViewController+TableView.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension WorkOrdersTableViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workOrders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BasicTableViewCell
        let workOrder = workOrders[indexPath.row].title
        cell.topLeftLabel.text = workOrder
        cell.topRightLabel.text = ""
        cell.bottomLeftLabel.text = workOrderModel.model ?? ""
        cell.bottomRightLabel.text = Date().formatted()
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workOrder = workOrders[indexPath.row]
        let controller = PDFViewController()
        if let pdf = workOrder.document {
            controller.pdf = pdf
            navigationController?.pushViewController(controller, animated: true)
        } else {
            print("PDF is nil.")
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! HeaderTableViewCell
        header.titleLabel.text = workOrderModel.model ?? ""
        header.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        if workOrders.count == 0 {
            header.subtitleLabel.text = "No work orders have been added."
        } else {
            header.subtitleLabel.text = "\(workOrders.count) result(s) found"
        }
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

}
