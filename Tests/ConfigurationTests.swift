import XCTest
@testable import Kryptonim

class ConfigurationTests: XCTestCase {

  func testEmptyConfiguration() throws {
    let configuration = Configuration(environment: .sandbox)
    let url = try configuration.buildUrlWithParameters()
    XCTAssertEqual(url.absoluteString, Constants.sandboxUrl)
  }

  func testConfigurationWithParameters() throws {
    let transaction = Transaction(amount: "20", currency: .eur)
    let configuration = Configuration(
      environment: .sandbox,
      transaction: transaction,
      theme: .dark
    )
    let url = try configuration.buildUrlWithParameters()
    let expectedUrl = Constants.sandboxUrl + "?amount=20&currency=EUR&theme=dark"
    XCTAssertEqual(url.absoluteString, expectedUrl)
  }

}
