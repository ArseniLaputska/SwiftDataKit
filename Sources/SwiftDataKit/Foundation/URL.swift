//
//  URL.swift
//
//
//  Created by Yang Xu on 2023/9/5.
//

import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

public extension URL {
    // Computed property to create a PersistentIdentifier from a URL
    @available(macOS 13, iOS 16, tvOS 16, watchOS 9, visionOS 1.0, *)
    var persistentIdentifier: PersistentIdentifier? {
        guard scheme == "x-coredata",
              let host = host()
        else {
            return nil
        }
        let pathComponents = self.pathComponents
        guard pathComponents.count == 3 else {
            return nil
        }
        let entityName = pathComponents[1]
        let primaryKey = pathComponents[2]
        let json = PersistentIdentifierJSON(
            implementation: .init(primaryKey: primaryKey,
                                  uriRepresentation: self,
                                  isTemporary: false,
                                  storeIdentifier: host,
                                  entityName: entityName)
        )
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(json) else {
            return nil
        }
        let decoder = JSONDecoder()
        return try? decoder.decode(PersistentIdentifier.self, from: data)
    }
}
