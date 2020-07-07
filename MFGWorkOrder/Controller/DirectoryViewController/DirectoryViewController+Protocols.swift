//
//  DirectoryViewController+Protocols.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/28/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension DirectoryViewController: QRScannerViewControllerDelegate {
    func qrScannerViewController(didFail: Bool, str: String?) {
        guard let fileName = str, let pdf = getPDF(fileName: fileName) else { return }
        // guard let fileName = fileNames.first(where: { $0.uppercased().contains(".PDF") }) else { return }
        print("File Name: \(fileName)")
        let controller = PDFViewController()
        controller.pdf = pdf
        controller.navigationItem.title = fileName
        navigationController?.pushViewController(controller, animated: true)
    }
}
