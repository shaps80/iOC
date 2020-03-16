import XCTest
@testable import iOC

final class iOCTests: XCTestCase {

    func testContainer() {
        let container = Container()

        container.register { MockA(mockB: $0.resolve()) }
        container.register { MockB(mockC: $0.resolve()) }.resolveCyclicDependencies { _, mockB in
            mockB.mockC.mockB = mockB
        }
        container.register { _ in MockC() }

        let mockA: MockA = container.resolve()
        XCTAssertNotNil(mockA)
        XCTAssertNotNil(mockA.mockB)
        XCTAssertNotNil(mockA.mockB.mockC)
        XCTAssertNotNil(mockA.mockB.mockC.mockB)
    }

    static var allTests = [
        ("testContainer", testContainer),
    ]
    
}

final class MockA {
    let mockB: MockB
    init(mockB: MockB) {
        self.mockB = mockB
    }
}

final class MockB {
    let mockC: MockC
    init(mockC: MockC) {
        self.mockC = mockC
    }
}

final class MockC {
    weak var mockB: MockB?
    init() { }
}
