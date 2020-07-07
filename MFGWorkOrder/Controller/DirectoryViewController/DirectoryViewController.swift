//
//  DirectoryViewController.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/23/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit
import PDFKit

class DirectoryViewController: UIViewController {

    var isRoot: Bool = false {
        didSet {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Scan QR Code",
                style: .plain,
                target: self,
                action: #selector(handleScanQRCode)
            )
        }
    }

    var fileNames: [String] = [] {
        didSet {// System.directoryservices.accountmanagement
            tableView.reloadData()
        }
    }

    var path: String = "Root"

    let cellId: String = "cell-id"
    let thumbnailCellId: String = "thumbnail-cell-id"
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let dummyNames: [String] = [
            "AMS3015INS",
            "AMSCL",
            "AMST10",
            "LWY112799--A_OI.PDF",
            "LWY201874---_OI.PDF",
            "LWY201875---_OI.PDF"
        ]
        fileNames = dummyNames

        if let navigationController = navigationController {
            navigationController.navigationBar.topItem?.title = path
        }
    }

    func setup() {
        view.backgroundColor = .white

        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func getPDF(fileName: String) -> PDFDocument? {
        var pdfDocument: PDFDocument?
        if let path = Bundle.main.path(forResource: fileName, ofType: ""),
            let pdf = PDFDocument(url: URL(fileURLWithPath: path)) {
                pdfDocument = pdf
        }
        return pdfDocument
    }
}

