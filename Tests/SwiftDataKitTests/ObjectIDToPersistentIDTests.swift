//
//  ObjectIDToPersistentIDTests.swift
//
//
//  Created by Yang Xu on 2023/9/5.
//

import Foundation
#if canImport(SwiftData)
import SwiftData
#endif
@testable import SwiftDataKit
import XCTest

class ObjectIDToPersistentIDTests: XCTestCase {
    @available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
    func testGetCollectionPersistentIdentifier() async throws {
        let container = try ModelContainer(for: ArticleCollection.self, Article.self, Category.self, configurations: .init(isStoredInMemoryOnly: true))
        let dataHandler = ArticleHandler(modelContainer: container)
        try await dataHandler.dataGenerator()

        let queryHandler = ArticleHandler(modelContainer: container)
        let names = await queryHandler.getCollectNamesByCategoryByKit(categoryName: Category.Name.tech.rawValue)
        let ids = await queryHandler.getCollectPersistentIdentifiersByTagByKit(categoryName: Category.Name.tech.rawValue)
        let collections = await queryHandler.convertIdentifierToModel(ids: ids, type: ArticleCollection.self)
        XCTAssertEqual(names, collections.map(\.name))
    }
}
