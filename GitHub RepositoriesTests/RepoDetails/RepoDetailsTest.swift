//
//  RepoDetailsTest.swift
//  GitHub RepositoriesTests
//
//  Created by Eman Gaber on 12/5/20.
//

import XCTest
@testable import GitHub_Repositories

/**
 * This TestCase tests the RepositoryDetailsPresenter
 */

class RepoDetailsTest: XCTestCase {
    
    var repoDetailsPresenterSUT: RepositoryDetailsPresenter!
    weak var repoView: RepositoryDetailsView?
    let handler = DIDataHandler.sharedInstance()
    
    var expectation: XCTestExpectation!
    
    private let validRepoFullName = "EmanGaber/GitHubRepositories"
    private let invalidRepoFullName = "EmanGaber/hellow-world"
    
    override func setUpWithError() throws {
        
        repoDetailsPresenterSUT = RepositoryDetailsPresenter(view: repoView)
        
    }
    
    override func tearDownWithError() throws {
        repoDetailsPresenterSUT = nil
    }
    
    
    func testGetRepoDetailsApi_Success() {
        expectation = self.expectation(description: "testing get repo details successfully")
        
        repoDetailsPresenterSUT.callRepositoryDetailsApi(fullName: validRepoFullName, delegate: self)
        
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testGetRepoDetailsApi_Fail() {
        expectation = self.expectation(description: "testing get repo details Failed")
        
        repoDetailsPresenterSUT.callRepositoryDetailsApi(fullName: invalidRepoFullName, delegate: self)
        
        wait(for: [expectation], timeout: 10)
        
    }
}

extension RepoDetailsTest:DIDynamicDataDelegate {
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
        expectation.fulfill()
    }
    
    
    func getRepositoryDetailsSucces(_ repositoryModel: RepositoryModel!) {
        
        repoDetailsPresenterSUT.repo = repositoryModel
        
        XCTAssertNotNil(repoDetailsPresenterSUT.repo)
        XCTAssertEqual(repoDetailsPresenterSUT.repo.repository_language, "Objective-C")
        
        expectation.fulfill()
        
    }
}


