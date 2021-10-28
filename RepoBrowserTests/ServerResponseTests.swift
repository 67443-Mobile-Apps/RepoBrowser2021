// Created for RepoBrowser on 11/16/20 
// Using Swift 5.0 
// Running on macOS 11.0
// Qapla'
//

import XCTest
@testable import RepoBrowser

class ServerResponseTests: XCTestCase {

  // MARK: - Testing Server Response Asynchronously
  // Simply testing first that the server is responding and sending data (no tests on what the response is)
  
  // Start with a basic setup method
  let expired: TimeInterval = 1.5
  var expectation: XCTestExpectation!

  override func setUp() {
    expectation = expectation(description: "Server responds in reasonable time")
  }
  
  
  // Test the negative case first with a nonsense URL
  func test_noServerResponse() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "fred")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNil(data)
      XCTAssertNil(response)
      XCTAssertNotNil(error)
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the affirmative case with GitHub API URL
  func test_ServerResponse() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the case with GitHub API for Kotlin
  func test_ServerResponseForKotlin() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://api.github.com/search/repositories?q=language:kotlin&sort=stars&order=desc")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the case with GitHub API with a 404 response
  func test_404Error() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://api.github.com/search/repository")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      do {
        let response = try XCTUnwrap(response as? HTTPURLResponse)
        XCTAssertEqual(response.statusCode, 404)

      } catch { }
      
      self.expectation.fulfill()
    }
    .resume()
  }
  
  // Now test the case with GitHub API with invalid parameters (a 422 response)
  func test_invalidParameters() {
    defer { waitForExpectations(timeout: expired) }

    let url = URL(string: "https://api.github.com/search/repositories?q=language:klingon")!
    URLSession.shared.dataTask(with: url) { data, response, error in

      XCTAssertNotNil(data)
      XCTAssertNotNil(response)
      XCTAssertNil(error)
      do {
        let response = try XCTUnwrap(response as? HTTPURLResponse)
        // validation failed status code is 422
        XCTAssertEqual(response.statusCode, 422)

      } catch { }
      
      self.expectation.fulfill()
    }
    .resume()
  }

}
