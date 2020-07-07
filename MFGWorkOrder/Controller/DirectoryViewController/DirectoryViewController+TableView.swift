//
//  DirectoryViewController+TableView.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/24/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit
import PDFKit

extension DirectoryViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(PDFPreviewTableViewCell.self, forCellReuseIdentifier: thumbnailCellId)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: headerId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fileName = fileNames[indexPath.row]
        let isPDF = fileName.uppercased().contains(".PDF")

        if isPDF {
            let cell = tableView.dequeueReusableCell(withIdentifier: thumbnailCellId) as! PDFPreviewTableViewCell
            let fileName = fileNames[indexPath.row]
            cell.topLeftLabel.text = fileName
            if let pdfDoc = getPDF(fileName: fileName) {
                cell.pdf = pdfDoc
            }
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BasicTableViewCell
            let fileName = fileNames[indexPath.row]
            cell.topLeftLabel.text = fileName
            cell.topRightLabel.text = ""
            cell.bottomLeftLabel.text = ""
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let fileName = fileNames[indexPath.row]
        let isPDF = fileName.uppercased().contains(".PDF")
        if isPDF {
            return 140
        }
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fileName = fileNames[indexPath.row]
        let isPDF = fileName.uppercased().contains(".PDF")

        if isPDF {
            if let pdfDoc = getPDF(fileName: fileName) {
                let controller = PDFViewController()
                controller.pdf = pdfDoc
                navigationController?.pushViewController(controller, animated: true)
            }
        } else {
            let controller = DirectoryViewController()
            controller.path = "\(path)\\\(fileName)"
            controller.fileNames = fileNames
            navigationController?.pushViewController(controller, animated: true)
        }
    }

    /*
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
     */

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

}
