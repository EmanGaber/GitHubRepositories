//
//  GitHub_RepositoriesTests.swift
//  GitHub RepositoriesTests
//
//  Created by Eman Gaber on 12/6/20.
//

import XCTest
@testable import GitHub_Repositories

/**
 * This TestCase tests the RepositoriesPresenter
 */

class SearchRepoTests: XCTestCase {
    
    var searchRepoPresenterSUT: RepositoriesPresenter!
    weak var repoView: RepositoriesView?
    let handler = DIDataHandler.sharedInstance()
    var expectation: XCTestExpectation!
    
    private let query = "hellow"
    private let page = 1
    private let pageSize = 10
    
    override func setUpWithError() throws {
        
        searchRepoPresenterSUT = RepositoriesPresenter(view: repoView)
        
    }
    
    override func tearDownWithError() throws {
        
        searchRepoPresenterSUT = nil
        
    }
    
    func testSearchRepoApi_Success() {
        expectation = self.expectation(description: "Testing search repo success fetch")
        
        searchRepoPresenterSUT.callRepositoriesApi(query: query, page: page, pageSiza:pageSize, delegate: self)
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testSearchRepoApi_Fail() {
        expectation = self.expectation(description: "Testing search repo fail case")
        
        searchRepoPresenterSUT.callRepositoriesApi(query: "", page: page, pageSiza:pageSize, delegate: self)
        wait(for: [expectation], timeout: 10)
        
    }
    
    
    func testRepoCreationDate_MoreThan6Months() {
        let date = searchRepoPresenterSUT.getRepoCreationDateFrom(date: "2016-09-17T07:15:26Z")
        
        XCTAssertEqual(date, "4 years ago")
        
    }
    
    func testRepoCreationDate_LessThan6Months() {
        let date = searchRepoPresenterSUT.getRepoCreationDateFrom(date: "2020-09-17T07:15:26Z")
        
        XCTAssertEqual(date, "Thursday, Sep 17, 2020")
        
    }
    
    func testDidSelectRepository()
    {
        searchRepoPresenterSUT.didSelectRepository(index: 0)
    }
    
    
}


extension SearchRepoTests:DIDynamicDataDelegate {
    func requestStart() {
        
    }
    
    func requestEndDueToInternetError() {
        if expectation != nil{
            expectation.fulfill()
        }
    }
    
    func requestEndDue(toError error: Error!) {
        XCTAssertNotNil(error)
        if expectation != nil{
            expectation.fulfill()
        }
    }
    
    func getRepositoriesFail(withResponse error: String!) {
        XCTAssertNotNil(error)
        // when it finishes, mark my expectation as being fulfilled
        expectation.fulfill()
    }
    
    
    func getRepositoriesSucces(_ repositoryArray: NSMutableArray!, andTotalCount totalCount: String!){
        searchRepoPresenterSUT.repositorArray = (repositoryArray as! [RepositoryModel])
        
        print(repositoryArray.count)
        XCTAssertFalse(searchRepoPresenterSUT.repositorArray!.isEmpty)
        
        XCTAssertEqual(searchRepoPresenterSUT.repositorArray!.count , 10)
        
        // when it finishes, mark my expectation as being fulfilled
        expectation.fulfill()
        
        testDidSelectRepository()
        
        
    }
    
}
