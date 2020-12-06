//
//  GitHub_RepositoriesUITests.swift
//  GitHub RepositoriesUITests
//
//  Created by Eman Gaber on 12/4/20.
//

import XCTest

class SearchRepoUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
}

//MARK:- Tests
extension SearchRepoUITests {
    
    func testSearchWith_InvalidQuery() {
        //test search with one character
        
        let invalidQuery = "h"
        let searchTextField = app.textFields["Repository Name"]
        
        XCTAssertTrue(searchTextField.exists)
        
        // Typing query
        searchTextField.tap()
        searchTextField.typeText(invalidQuery)
        
        // Ensure activity indicator is invisible
        let inProgressElement = app.otherElements.containing(.activityIndicator, identifier:"In progress").element
        XCTAssertFalse(inProgressElement.exists)
        
    }
    
    
    func testSearchWith_ValidQuery() {
        //test search with more than one character
        let validQuery = "hellow"
        let searchTextField = app.textFields["Repository Name"]
        
        XCTAssertTrue(searchTextField.exists)
        
        // Typing query
        searchTextField.tap()
        searchTextField.typeText(validQuery)
        
        // Ensure activity indicator is visible
        let inProgressElement = app.otherElements.containing(.activityIndicator, identifier:"In progress").element
        XCTAssertTrue(inProgressElement.exists)
        
        
    }
    
    

}
