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
@MainActor
class URLtoPersistentIdentifierTests: XCTestCase {
    func testURLtoPersistentIdentifier() async throws {
        let container = try ModelContainer(for: Student.self, configurations: .init(isStoredInMemoryOnly: true))
        let hander = StudentHandler(modelContainer: container)
        let student = try await hander.createNewStudent()
        guard let identifier = student.persistentModelID.uriRepresentation?.persistentIdentifier else {
            XCTFail("Failed to get persistent identifier")
            return
        }
        XCTAssertEqual(student.persistentModelID, identifier)
    }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, visionOS 1, *)
extension StudentHandler {
    func createNewStudent(name: String = "fat", birthOfYear: Int = 2000) throws -> Student {
        let student = Student(name: name, birthOfYear: birthOfYear)
        modelContext.insert(student)
        try! modelContext.save()
        return student
    }
}
