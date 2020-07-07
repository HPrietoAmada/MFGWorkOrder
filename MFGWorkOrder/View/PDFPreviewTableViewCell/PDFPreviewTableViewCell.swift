//
//  PDFPreviewTableViewCell.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/28/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit
import PDFKit

class PDFPreviewTableViewCell: UITableViewCell {

    var pdf: PDFDocument? {
        didSet {
            guard let pdf = pdf, let firstPage = pdf.page(at: 0) else { return }
            let pdfView = PDFView()
            pdfView.document = pdf
            pdfView.go(to: firstPage)
            thumbnailView.pdfView = pdfView
        }
    }

    let topLeftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bottomLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let thumbnailView: PDFThumbnailView = {
        let view = PDFThumbnailView()
        view.layoutMode = .horizontal
        view.thumbnailSize = CGSize(width: 120, height: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let border: BorderView = {
        return BorderView()
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func setup() {
        addSubview(topLeftLabel)
        addSubview(bottomLeftLabel)
        addSubview(thumbnailView)
        addSubview(border)

        topLeftLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        topLeftLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topLeftLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        bottomLeftLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        bottomLeftLabel.topAnchor.constraint(equalTo: topLeftLabel.bottomAnchor).isActive = true
        bottomLeftLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomLeftLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        thumbnailView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        thumbnailView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        thumbnailView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbnailView.rightAnchor.constraint(equalTo: rightAnchor, constant: -120).isActive = true

        border.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        border.leftAnchor.constraint(equalTo: topLeftLabel.leftAnchor).isActive = true
        border.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
