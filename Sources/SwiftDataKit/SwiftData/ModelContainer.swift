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
    @available(iOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `objectModel` property.")
    @available(macOS, introduced: 14, deprecated: 15, message: "SwiftData not contains `objectModel` property.")
    @available(visionOS, introduced: 1, deprecated: 2, message: "SwiftData not contains `objectModel` property.")
    @available(watchOS, introduced: 10, deprecated: 11, message: "SwiftData not contains `objectModel` property.")
    @available(tvOS, introduced: 17, deprecated: 18, message: "SwiftData not contains `objectModel` property.")
    @MainActor
    var objectModel: NSManagedObjectModel? {
        mainContext.objectModel
    }
}
