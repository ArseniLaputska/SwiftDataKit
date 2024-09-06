//
//  File.swift
//
//
//  Created by Yang Xu on 2023/8/23.
//

import CoreData
import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

// Extension to add computed properties for accessing underlying CoreData implementation details
@available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
public extension ModelContext {
    // Computed property to access the underlying NSManagedObjectContext
    var managedObjectContext: NSManagedObjectContext? {
        guard let managedObjectContext = getMirrorChildValue(of: self, childName: "_nsContext") as? NSManagedObjectContext else {
            return nil
        }
        return managedObjectContext
    }

    // Computed property to access the NSPersistentStoreCoordinator
    var coordinator: NSPersistentStoreCoordinator? {
        managedObjectContext?.persistentStoreCoordinator
    }

    // Computed property to access the NSManagedObjectModel
    var objectModel: NSManagedObjectModel? {
        coordinator?.managedObjectModel
    }
}
