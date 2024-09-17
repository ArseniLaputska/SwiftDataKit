//
//  BackingData.swift
//
//
//  Created by Yang Xu on 2023/9/20.
//

import CoreData
import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
public extension BackingData {
    // Computed property to access the NSManagedObject
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObject` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `managedObject` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `managedObject` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `managedObject` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObject` property.")
    var managedObject: NSManagedObject? {
        guard let object = getMirrorChildValue(of: self, childName: "_managedObject") as? NSManagedObject else {
            return nil
        }
        return object
    }

    // Computed property to access the NSManagedObjectContext
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObjectContext` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `managedObjectContext` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `managedObjectContext` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `managedObjectContext` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObjectContext` property.")
    var managedObjectContext: NSManagedObjectContext? {
        guard let object = getMirrorChildValue(of: self, childName: "_nsContext") as? NSManagedObjectContext else {
            return nil
        }
        return object
    }
}
