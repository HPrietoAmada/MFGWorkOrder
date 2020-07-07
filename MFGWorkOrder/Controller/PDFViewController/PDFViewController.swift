//
//  PDFViewController.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    var pdf: PDFDocument? {
        didSet {
            guard let document = pdf else { return }
            pdfView.document = document
            previousButton.isEnabled = false
            nextButton.isEnabled = document.pageCount > 1
        }
    }

    var canClose: Bool = false {
        didSet {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: "Close",
                style: .plain,
                target: self,
                action: #selector(handleClose)
            )
        }
    }

    let pdfView: PDFView = {
        let view = PDFView()
        //view.displayMode = .singlePage
        view.autoScales = true
        view.displayDirection = .horizontal
        view.usePageViewController(true, withViewOptions: [:])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var nextButton: UIBarButtonItem = {
        let view = UIBarButtonItem(
            title: "Next>",
            style: .plain,
            target: self,
            action: #selector(handleGoForward)
        )
        return view
    }()

    lazy var previousButton: UIBarButtonItem = {
        let view = UIBarButtonItem(
            title: "<Previous",
            style: .plain,
            target: self,
            action: #selector(handleGoBack)
        )
        return view
    }()

    @objc func handleGoForward() {
        pdfView.goToNextPage(self)
        manageNavPreviousAndNext()
    }

    @objc func handleGoBack() {
        pdfView.goToPreviousPage(self)
        manageNavPreviousAndNext()
    }

    private func manageNavPreviousAndNext() {
        guard let document = pdfView.document, let currentPage = pdfView.currentPage else { return }
        let pageCount = document.pageCount - 1
        let currentPageNumber = document.index(for: currentPage)
        previousButton.isEnabled = currentPageNumber != 0
        nextButton.isEnabled = pageCount != currentPageNumber
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handlePageChange),
            name: Notification.Name.PDFViewSelectionChanged,
            object: nil
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
    }

    func setup() {
        view.addSubview(pdfView)

        if let navigationController = self.navigationController {
            pdfView.topAnchor.constraint(equalTo: navigationController.navigationBar.bottomAnchor).isActive = true
        } else {
            pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pdfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pdfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pdfView.delegate = self

        navigationItem.rightBarButtonItems = [
            nextButton,
            previousButton
        ]

        //UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }

    @objc func handlePageChange(_ sender: NSNotification) {
        guard let pdfDoc = pdfView.document,
            let currentPage = pdfView.currentPage else { return }
        let pageNumber = pdfDoc.index(for: currentPage)
        print("Page Number: \(pageNumber)")
        manageNavPreviousAndNext()
    }

    @objc func handleClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
