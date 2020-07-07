//
//  WorkOrderTypeModel.swift
//  MFGWorkOrder
//
//  Created by IT Support on 11/22/19.
//  Copyright © 2019 IT Support. All rights reserved.
//

import Foundation

class WorkOrderType {
    public var id: Int = 0
    public var type: String?

    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }

    init() {
        self.type = ""
    }

    func getTypes() -> [WorkOrderType] {
        return [
            WorkOrderType(id: 1, type: "Light Weld"),
            WorkOrderType(id: 2, type: "Heavy Weld"),
            WorkOrderType(id: 3, type: "Bluco Setup Instructions")
        ]
    }
}
