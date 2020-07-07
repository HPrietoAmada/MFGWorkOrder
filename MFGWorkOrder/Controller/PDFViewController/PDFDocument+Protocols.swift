//
//  PDFDocument+Protocols.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/28/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit
import PDFKit

extension PDFViewController: PDFViewDelegate {

    func pdfViewPerformGo(toPage sender: PDFView) {
        print("pdf performGo")
    }

}
