//
//  WorkOrderModelModel.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

class WorkOrderModel {
    public var id: Int = 0
    public var model: String?
    public var typeId: Int = 0

    init(id: Int, typeId: Int, model: String) {
        self.id = id
        self.typeId = typeId
        self.model = model
    }

    init() {
        self.model = ""
    }

    func getModels() -> [WorkOrderModel] {
        return [
            // heavy weld
            WorkOrderModel(id: 1, typeId: 2, model: "HW_AMS3015-ROS"),
            WorkOrderModel(id: 2, typeId: 2, model: "HW_AMS4020 CL"),
            // light weld
            WorkOrderModel(id: 3, typeId: 1, model: "LW_AMS3015-CL"),
            WorkOrderModel(id: 4, typeId: 1, model: "LW_AMS3015ROS"),
            WorkOrderModel(id: 5, typeId: 1, model: "LW_AMS4020 CL"),
            WorkOrderModel(id: 6, typeId: 1, model: "LW_AMS4020-ROS"),
            WorkOrderModel(id: 7, typeId: 1, model: "LW_LST3015 G9"),
            WorkOrderModel(id: 8, typeId: 1, model: "LW_LST4020 CL"),
        ]
    }
}
