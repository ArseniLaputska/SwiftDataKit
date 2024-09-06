//
//  PersistentIdentifier.swift
//
//
//  Created by Yang Xu on 2023/8/23.
//

import CoreData
import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

// Extension to add computed properties for accessing underlying CoreData
// implementation details of PersistentIdentifier
@available(macOS 13, iOS 16, tvOS 16, watchOS 9, visionOS 1, *)
public extension PersistentIdentifier {
    // Private stored property to hold reference to underlying implementation
    private var _implementation: Any? {
        guard let implementation = getMirrorChildValue(of: self, childName: "implementation") else {
            return nil
        }
        return implementation
    }

    // Computed property to access managedObjectID from implementation
    var objectID: NSManagedObjectID? {
        guard let _implementation, let objectID = getMirrorChildValue(of: _implementation, childName: "managedObjectID") as? NSManagedObjectID else {
            return nil
        }
        return objectID
    }

    // Computed property to access uriRepresentation from objectID
    var uriRepresentation: URL? {
        objectID?.uriRepresentation()
    }

    // Computed property to access isTemporary from implementation
    var isTemporary: Bool? {
        guard let _implementation, let isTemporary = getMirrorChildValue(of: _implementation, childName: "isTemporary") as? Bool else {
            return nil
        }
        return isTemporary
    }
}
