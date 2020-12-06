//
//  TestExtenstions.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/6/20.
//

import XCTest

extension XCTestCase {
    
    
    /// Waits fot a specified element to appear for specified amount of time
    func wait(forElement element: XCUIElement, timeout: TimeInterval, completion: ((Error?)->())? = nil) {
        let predicate = NSPredicate(format: "exists == 1")
        // This will make the test runner continously evalulate the
        // predicate, and wait until it matches.
        expectation(for: predicate, evaluatedWith: element)
        waitForExpectations(timeout: timeout) { error in
            completion?(error)
        }
    }
}
