//
//  CoreDataManager+DocumentNotesCore.swift
//  MFGWorkOrder
//
//  Created by IT Support on 1/28/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import CoreData

typealias documentNotesCoreModelReturned = (DocumentNotesCore?, Error?) -> Void
typealias documentNotesCoreModelsReturned = ([DocumentNotesCore], Error?) -> Void

extension CoreDataManager {

    func save(model: DocumentNotesCore, _ completionHandler: documentNotesCoreModelReturned?) {
        let context = CoreDataManager.shared.persistentContainer.viewContext

        let object = NSEntityDescription.insertNewObject(forEntityName: "SalesmanCore", into: context) as! DocumentNotesCore
        object.setValue(model.documentName, forKey: "documentName")
        object.setValue(model.notes, forKey: "notes")
        object.setValue(model.pageNumber, forKey: "pageNumber")

        do {
            try context.save()
            completionHandler?(object, nil)
        } catch let err {
            completionHandler?(nil, err)
        }
    }

    func get(_ completionHandler: documentNotesCoreModelsReturned) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DocumentNotesCore>(entityName: "DocumentNotesCore")

        do {
            let models = try context.fetch(fetchRequest)
            completionHandler(models, nil)
        } catch let err {
            completionHandler([], err)
        }
    }

    func delete(model: DocumentNotesCore, _ completionHandler: ProgressComplete?) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(model)
        do {
            try context.save()
            completionHandler?(true, nil)
        } catch let err {
            completionHandler?(false, err)
        }
    }

    func deleteAllDocumentNotesCore() {
        get { (coreModels: [DocumentNotesCore], error) in
            if let _ = error {
                return
            }
            coreModels.forEach { (coreModel) in
                delete(model: coreModel, nil)
            }
        }
    }

}
