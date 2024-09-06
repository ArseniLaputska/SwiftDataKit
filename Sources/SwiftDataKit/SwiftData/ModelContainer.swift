//
//  File.swift
//
//
//  Created by Yang Xu on 2023/9/16.
//

import CoreData
import Foundation
#if canImport(SwiftData)
import SwiftData
#endif

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
extension ModelContainer {
    // Computed property to access the NSManagedObjectModel
    @MainActor
    var objectModel: NSManagedObjectModel? {
        mainContext.objectModel
    }
}
