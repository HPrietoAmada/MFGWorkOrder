//
//  WorkOrderModel.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation
import PDFKit

class WorkOrderFile {
    public var document: PDFDocument?
    public var title: String?
    public var created: Date?
    public var modelId: Int = 0
    public var typeId: Int = 0

    init(typeId: Int, modelId: Int, documentName: String) {
        self.title = documentName
        if let path = Bundle.main.path(forResource: documentName, ofType: "") {
            if let document = PDFDocument(url: URL(fileURLWithPath: path)) {
                self.document = document
            }
        }
        self.modelId = modelId
        self.typeId = typeId
        self.created = Date()
    }

    init() {
        self.title = ""
        self.created = Date()
    }

    func getFiles() -> [WorkOrderFile] {
        return [
            /* HEAVY WELD */
            // HW_AMS3015-ROS
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY201723--D_A01.pdf"),
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY201724--B_OI.pdf"),
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY201725---_OI.pdf"),
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY201726--B_A01.pdf"),
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY201727--B_A01.pdf"),

            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY202124---_OI.pdf"),
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY202125---_OI.pdf"),
            WorkOrderFile(typeId: 2, modelId: 1, documentName: "HWY202126---_OI.pdf"),

            // HW_AMS4020 CL
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201960--A FT Frame Weldment_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201961--A ST Frame Weldment_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201962--B Main Frame Final Weldment_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201962--B Main Frame LHS Weldment_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201962--B Main Frame RHS Weldment_OI.PDF"),

            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201964--B Sub Frame Final Weldment_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201964--B Sub Frame LHS_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201964--B Sub Frame RHS_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201969--A Fork Frame Weldment_OI.PDF"),
            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y201970--A Suction Frame Weldment_OI.PDF"),

            WorkOrderFile(typeId: 2, modelId: 2, documentName: "HW-Y202012--A STATIONARY TABLE WELDMENT_OI.PDF"),

            // LIGHT WELD

            //LW_LST4020 CL
            WorkOrderFile(typeId: 1, modelId: 8, documentName: "LWY112799--A_OI.PDF"),
            WorkOrderFile(typeId: 1, modelId: 8, documentName: "LWY201874---_OI.PDF"),
            WorkOrderFile(typeId: 1, modelId: 8, documentName: "LWY201875---_OI.PDF"),

            //LW_LST3015 G9
            WorkOrderFile(typeId: 1, modelId: 7, documentName: "Y108889--Wheel Cover.pdf"),
            WorkOrderFile(typeId: 1, modelId: 7, documentName: "Y201038--Cover.pdf"),
            WorkOrderFile(typeId: 1, modelId: 7, documentName: "Y20101400 Rib.pdf"),
            WorkOrderFile(typeId: 1, modelId: 7, documentName: "Y20102200 Shot pin Cover.pdf"),

            //LW_AMS4020-ROS
            WorkOrderFile(typeId: 1, modelId: 6, documentName: "LWY114182---_OI.PDF"),
            WorkOrderFile(typeId: 1, modelId: 6, documentName: "LWY114183---_OI.PDF"),
            WorkOrderFile(typeId: 1, modelId: 6, documentName: "LWY201786--A_OI.PDF"),
            WorkOrderFile(typeId: 1, modelId: 6, documentName: "LWY202161---_OI.PDF"),
            WorkOrderFile(typeId: 1, modelId: 6, documentName: "LWY202162---_OI.PDF"),

            //LW_AMS4020 CL
            WorkOrderFile(typeId: 1, modelId: 5, documentName: "LW_Y201845---_OI_MT.pdf"),
            WorkOrderFile(typeId: 1, modelId: 5, documentName: "LW_Y201974--A CDC2_OI_MT.pdf"),
            WorkOrderFile(typeId: 1, modelId: 5, documentName: "LW_Y201975--A-AOI_Stamped.pdf"),
            WorkOrderFile(typeId: 1, modelId: 5, documentName: "LW_Y201979--A CDC1_OI_MT.pdf"),

            //LW_AMS3015-CL
            WorkOrderFile(typeId: 1, modelId: 4, documentName: "AMS3015CL Light Weldment Picture List Rev A02 ME18-0107 LEON.PDF"),


            /* Bluco Setup Instructions */
            WorkOrderFile(typeId: 3, modelId: 0, documentName: "HW_M200551---_OI_MT_RELEASED.pdf"),
            WorkOrderFile(typeId: 3, modelId: 0, documentName: "HW_M200552---_OI_MT_RELEASED.pdf")
        ]
    }
}
