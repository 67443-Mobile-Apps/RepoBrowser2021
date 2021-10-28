// Created for RepoBrowser on 10/27/21 
// Using Swift 5.0 
// Running on macOS 11.6
// Qapla'
//

import XCTest

class RepoBrowserUITests: XCTestCase {
  
  var app: XCUIApplication!

  override func setUpWithError() throws {
    app = .init()
    app.launch()
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
  }
  
  func testExample() throws {
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }


  func testNavigation() throws {

    // Start app and identify key elements
    let tabBar = app.tabBars["Tab Bar"]
    let swiftButton = tabBar.buttons["Swift"]
    let moreButton = tabBar.buttons["More"]
    
    // Press the 'More' option
    moreButton.tap()
    
    // Identify one of the options under 'More'
    let dartButton = app.buttons["Dart"]
    
    // Test that we have indeed moved to 'More' option; tabs still visible
    XCTAssert(swiftButton.exists)
    XCTAssert(moreButton.exists)
    XCTAssert(dartButton.exists)
    
    // Click on the 'Dart' option and see the 'Flutter' table cell
    dartButton.tap()
    app.tables.cells["flutter, Flutter makes it easy and fast to build beautiful apps for mobile and beyond"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()

    XCTAssert(
      app
        .tables
        .cells["flutter, Flutter makes it easy and fast to build beautiful apps for mobile and beyond"]
        .children(matching: .other)
        .element(boundBy: 0)
        .children(matching: .other)
        .element.exists
    )
  }
  

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
