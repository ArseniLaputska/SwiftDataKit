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
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObjectContext` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `managedObjectContext` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `managedObjectContext` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `managedObjectContext` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObjectContext` property.")
    var managedObjectContext: NSManagedObjectContext? {
        guard let managedObjectContext = getMirrorChildValue(of: self, childName: "_nsContext") as? NSManagedObjectContext else {
            return nil
        }
        return managedObjectContext
    }

    // Computed property to access the NSPersistentStoreCoordinator
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `coordinator` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `coordinator` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `coordinator` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `coordinator` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `coordinator` property.")
    var coordinator: NSPersistentStoreCoordinator? {
        managedObjectContext?.persistentStoreCoordinator
    }

    // Computed property to access the NSManagedObjectModel
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `objectModel` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `objectModel` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `objectModel` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `objectModel` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `objectModel` property.")
    var objectModel: NSManagedObjectModel? {
        coordinator?.managedObjectModel
    }
}
