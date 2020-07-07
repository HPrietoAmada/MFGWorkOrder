//
//  WorkOrderTypeTableViewController+TableView.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit

extension WorkOrderTypeTableViewController: UITableViewDelegate, UITableViewDataSource {

    func getWorkOrderTypes() -> [WorkOrderType] {
        return WorkOrderType().getTypes()
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getWorkOrderTypes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BasicTableViewCell
        let workOrderType = getWorkOrderTypes()[indexPath.row].type
        cell.topLeftLabel.text = workOrderType
        cell.bottomLeftLabel.text = "Work Instruction"
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workOrderType = getWorkOrderTypes()[indexPath.row]
        if workOrderType.id != 3 {
            let controller = WorkOrderModelTableViewController()
            controller.workOrderType = workOrderType
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let workOrderFiles = WorkOrderFile().getFiles().filter({ $0.typeId == 3 })
            let controller = WorkOrdersTableViewController()
            controller.workOrders = workOrderFiles
            navigationController?.pushViewController(controller, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! HeaderTableViewCell
        header.titleLabel.text = "Work Instructions"
        header.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        if getWorkOrderTypes().count == 0 {
            header.subtitleLabel.text = "No work orders have been added."
        } else {
            header.subtitleLabel.text = "\(getWorkOrderTypes().count) result(s) found"
        }
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

}
