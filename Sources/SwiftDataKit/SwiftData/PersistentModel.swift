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
    var managedObject: NSManagedObject? {
        persistentBackingData.managedObject
    }
}
