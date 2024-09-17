//
//  PersistentModel.swift
//
//
//  Created by Yang Xu on 2023/8/23.
//

import CoreData
import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

/// Extension for `PersistentModel` that provides a computed property `managedObject` to access the underlying `NSManagedObject`.
@available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
public extension PersistentModel {
    /// Returns the `NSManagedObject` associated with the `PersistentModel`.
    ///
    /// - Returns: The `NSManagedObject?` instance.
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObject` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `managedObject` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `managedObject` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `managedObject` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `managedObject` property.")
    var managedObject: NSManagedObject? {
        persistentBackingData.managedObject
    }
}
