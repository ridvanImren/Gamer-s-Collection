//
//  DataController.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "GameData")
    
    static let shared = DataController()
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                viewContext.rollback()
                print(error.localizedDescription)
            }
        }
    }
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
