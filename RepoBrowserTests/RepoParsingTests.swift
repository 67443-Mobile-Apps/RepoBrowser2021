// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import XCTest
@testable import RepoBrowser

class RepoParsingTests: XCTestCase {
  
  let expired: TimeInterval = 10
  var expectation: XCTestExpectation!

  override func setUp() {
    expectation = expectation(description: "Able to parse the repo data received")
  }
  
  
  // MARK: - Testing Repository Parsing for Swift
  
  func test_ParseFirstSwiftRepo() {
    
    // Given...
    let swiftParser = Parser(language: "swift")

    // When...
    swiftParser.fetchRepositories  { (repos) in
      XCTAssertEqual(repos.first?.name, "awesome-ios")
      // XCTAssertEqual(repos.first?.name, "alamofire")
      XCTAssertEqual(repos.first?.htmlURL, "https://github.com/vsouza/awesome-ios")
      XCTAssertEqual(repos.first?.itemDescription, "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects ")
      self.expectation.fulfill()
    }
    
    // Wait how long...
    waitForExpectations(timeout: expired)
    
  }
  
  func test_ParseFirstSwiftRepoFails() {
    
    let swiftParser = Parser(language: "swift")

    swiftParser.fetchRepositories  { (repos) in
      XCTAssertNotEqual(repos.first?.name, "alamofire")
      self.expectation.fulfill()
    }
    
    waitForExpectations(timeout: expired)
  }
  
  func test_ParseSwiftReposCounted() {

    let swiftParser = Parser(language: "swift")

    swiftParser.fetchRepositories  { (repos) in
      XCTAssertEqual(repos.count, 30)
      self.expectation.fulfill()
    }

    waitForExpectations(timeout: expired)
  }
  
  // MARK: - Testing Repository Parsing for Ruby
  
  func test_ParseFirstRubyRepo() {
    
    // Given...
    let parser = parserFor("ruby")
    defer { waitForExpectations(timeout: expired) }
    
    // When...
    parser.fetchRepositories  { (repos) in
            
      XCTAssertEqual(repos.first?.name, "rails")
      XCTAssertEqual(repos.first?.htmlURL, "https://github.com/rails/rails")
      XCTAssertEqual(repos.first?.itemDescription, "Ruby on Rails")
      
      self.expectation.fulfill()
    }
  }
  
  // MARK: - Testing Repository Parsing for Kotlin
  
  func test_ParseFirstKotlinRepo() {
    
    let parser = parserFor("kotlin")
//    self.expectation.isInverted = true
    defer { waitForExpectations(timeout: expired) }

    parser.fetchRepositories  { (repos) in
      XCTAssertEqual(repos.first?.name, "okhttp")
      self.expectation.fulfill()
    }
  }
  
  private func parserFor(_ language: String) -> Parser {
    let parser = Parser(language: language)
    return parser
  }
  

}
