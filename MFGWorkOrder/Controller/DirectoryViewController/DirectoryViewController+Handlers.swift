//
//  DirectoryViewController+Handlers.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/28/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension DirectoryViewController {

    @objc func handleScanQRCode() {
        let controller = QRScannerViewController()
        controller.delegate = self
        present(
            controller,
            animated: true,
            completion: nil
        )
    }
}
