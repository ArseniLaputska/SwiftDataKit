//
//  File.swift
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

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
class SUBQUERYTests: XCTestCase {
    func testSubQueryByKit() async throws {
        let container = try ModelContainer(for: ArticleCollection.self, Article.self, Category.self, configurations: .init(isStoredInMemoryOnly: true))
        let handler = ArticleHandler(modelContainer: container)
        try await handler.dataGenerator()
        let countByKit = await handler.getCollectCountByCategoryByKit(categoryName: Category.Name.tech.rawValue)
        let countByQuery = await handler.getCollectCountByCategoryByQuery(categoryName: Category.Name.tech.rawValue)
        XCTAssertEqual(countByKit, countByQuery)
    }

    // 0.21s for 10000 articles
    func testSubQueryByKitPerformance() async throws {
        let container = try ModelContainer(for: ArticleCollection.self, Article.self, Category.self, configurations: .init(isStoredInMemoryOnly: true))
        let handler = ArticleHandler(modelContainer: container)
        try await handler.dataGenerator(collectionCount: 300, articleCount: 1000)
        await handler.reset()
        measureAsync(timeout: 10) {
            let _ = await handler.getCollectCountByCategoryByKit(categoryName: Category.Name.tech.rawValue)
        }
    }

    // 0.83s for 10000 articles
    func testSubQueryBySwiftDataPerformance() async throws {
        let container = try ModelContainer(for: ArticleCollection.self, Article.self, Category.self, configurations: .init(isStoredInMemoryOnly: true))
        let handler = ArticleHandler(modelContainer: container)
        try await handler.dataGenerator(collectionCount: 300, articleCount: 1000)
        await handler.reset()
        measureAsync(timeout: 10) {
            let _ = await handler.getCollectCountByCategoryByQuery(categoryName: Category.Name.tech.rawValue)
        }
    }
}
