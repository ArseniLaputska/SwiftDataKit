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

    @available(iOS, deprecated: 18.0, obsoleted: 18.0, message: "SwiftData has no objectID child.")
    @available(macOS, deprecated: 15.0, obsoleted: 15.0, message: "SwiftData has no objectID child.")
    @available(visionOS, deprecated: 2.0, obsoleted: 2.0, message: "SwiftData has no objectID child.")
    @available(tvOS, deprecated: 18.0, obsoleted: 18.0, message: "SwiftData has no objectID child.")
    @available(watchOS, deprecated: 11.0, obsoleted: 11.0, message: "SwiftData has no objectID child.")
    var objectID: NSManagedObjectID? {
        guard let _implementation, let objectID = getMirrorChildValue(of: _implementation, childName: "managedObjectID") as? NSManagedObjectID else {
            return nil
        }
        return objectID
    }
    
    @available(iOS 18, macOS 15, visionOS 2, tvOS 18, watchOS 11, *)
    private var _uriRepresntation: URL? {
        guard let _implementation, let uriRepresntation = getMirrorChildValue(of: _implementation, childName: "URIRepresentation") as? URL else {
            return nil
        }
        return uriRepresntation
    }

    // Computed property to access uriRepresentation from objectID
    var uriRepresentation: URL? {
        if #available(iOS 18, macOS 15, visionOS 2, tvOS 18, watchOS 11, *) {
            _uriRepresntation
        } else {
            objectID?.uriRepresentation()
        }
    }

    // Computed property to access isTemporary from implementation
    var isTemporary: Bool? {
        guard let _implementation, let isTemporary = getMirrorChildValue(of: _implementation, childName: "isTemporary") as? Bool else {
            return nil
        }
        return isTemporary
    }
}
