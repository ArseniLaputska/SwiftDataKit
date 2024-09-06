#if canImport(SwiftData)
import SwiftData
#endif
@testable import SwiftDataKit
import XCTest

final class CountByGroupTests: XCTestCase {
    
    @available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
    func testCountByGroup() async throws {
        let container = try ModelContainer(for: Student.self, configurations: .init(isStoredInMemoryOnly: true))
        let hander = StudentHandler(modelContainer: container)
        try await hander.dataGenerator()
        let kitResult = await hander.birthYearCountByKit()
        let queryResult = await hander.birthYearCountByQuery()
        XCTAssertEqual(kitResult, queryResult)
    }

    @available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
    func testCountByKitPerformance() async throws {
        let container = try ModelContainer(for: Student.self, configurations: .init(isStoredInMemoryOnly: true))
        let hander = StudentHandler(modelContainer: container)
        try await hander.dataGenerator(count: 10000)
        measureAsync(timeout: 2) {
            let _ = await hander.birthYearCountByKit()
        }
    }

    @available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
    func testCountByQueryPerformance() async throws {
        let container = try ModelContainer(for: Student.self, configurations: .init(isStoredInMemoryOnly: true))
        let hander = StudentHandler(modelContainer: container)
        try await hander.dataGenerator(count: 10000)
        measureAsync(timeout: 2) {
            let _ = await hander.birthYearCountByQuery()
        }
    }
}
