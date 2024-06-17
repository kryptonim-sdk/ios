import Foundation

/// Represents a configuration object for setting up a transaction.
/// - Parameters:
///   - url: The URL to load the iframe form
///   - environment: The environment in which the transaction will be processed
///   - transaction: Details of the transaction including amount and currency
///   - creditCard: Credit card information for the transaction
///   - billing: Billing information for the transaction
///   - theme: Theme settings for the interface
public struct Configuration {
  public var url: String
  public var transaction: Transaction?
  public var creditCard: CreditCard?
  public var billing: Billing?
  public var theme: Theme?

  public init(
    environment: Environment = .production,
    transaction: Transaction? = nil,
    creditCard: CreditCard? = nil,
    billing: Billing? = nil,
    theme: Theme? = nil
  ) {
    self.url = switch environment {
    case .sandbox: Constants.sandboxUrl
    case .production: Constants.productionUrl
    }
    self.transaction = transaction
    self.creditCard = creditCard
    self.billing = billing
    self.theme = theme
  }

  /// Builds a URL with specified parameters for the transaction.
  /// - Throws: An error of type `KryptonimError`
  /// - Returns: The constructed URL
  func buildUrlWithParameters() throws -> URL {
    guard var urlComponents = URLComponents(string: url) else {
      throw KryptonimError.invalidUrl
    }
    var queryItems: [URLQueryItem] = []

    /// Transaction object
    if let transaction {
      queryItems.appendIfNotNil(buildQueryItem(name: "amount", value: transaction.amount))
      queryItems.appendIfNotNil(buildQueryItem(name: "currency", value: transaction.currency?.rawValue))
      queryItems.appendIfNotNil(buildQueryItem(name: "convertedAmount", value: transaction.convertedAmount))
      queryItems.appendIfNotNil(buildQueryItem(name: "convertedCurrency", value: transaction.convertedCurrency?.rawValue))
      queryItems.appendIfNotNil(buildQueryItem(name: "blockchain", value: transaction.blockchain?.rawValue))
      queryItems.appendIfNotNil(buildQueryItem(name: "address", value: transaction.walletAddress))
      queryItems.appendIfNotNil(buildQueryItem(name: "paymentMethod", value: transaction.paymentMethod?.rawValue))
      queryItems.appendIfNotNil(buildQueryItem(name: "customerMail", value: transaction.customerMail))
      queryItems.appendIfNotNil(buildQueryItem(name: "m", value: transaction.m))
    }

    // CreditCard object
    if let creditCard {
      queryItems.appendIfNotNil(buildQueryItem(name: "cardNumber", value: creditCard.cardNumber))
      queryItems.appendIfNotNil(buildQueryItem(name: "cardCVV", value: creditCard.cardCVV))
      queryItems.appendIfNotNil(buildQueryItem(name: "cardHolder", value: creditCard.cardHolder))
      queryItems.appendIfNotNil(buildQueryItem(name: "cardExpMM", value: creditCard.expiration?.month))
      queryItems.appendIfNotNil(buildQueryItem(name: "cardExpYY", value: creditCard.expiration?.year))
    }

    // Billing object
    if let billing {
      queryItems.appendIfNotNil(buildQueryItem(name: "firstName", value: billing.firstName))
      queryItems.appendIfNotNil(buildQueryItem(name: "lastName", value: billing.lastName))
      queryItems.appendIfNotNil(buildQueryItem(name: "billingCity", value: billing.city))
      queryItems.appendIfNotNil(buildQueryItem(name: "billingStreetAddress", value: billing.streetAddress))
      queryItems.appendIfNotNil(buildQueryItem(name: "billingPostalCode", value: billing.postalCode))
      queryItems.appendIfNotNil(buildQueryItem(name: "billingCountry", value: billing.country))
      queryItems.appendIfNotNil(buildQueryItem(name: "billingCountryCode", value: billing.countryCode))
      queryItems.appendIfNotNil(buildQueryItem(name: "billingState", value: billing.state))
    }

    // Theme object
    if let theme {
      queryItems.appendIfNotNil(buildQueryItem(name: "theme", value: theme.rawValue))
    }

    if !queryItems.isEmpty { urlComponents.queryItems = queryItems }
    guard let url = urlComponents.url else {
      throw KryptonimError.invalidParameters
    }
    return url
  }

  /// If you declare `resultHandler` as not nil in `KryptonimView` or `KryptonimViewController` this method will be called to properly handle callback with either transaction success or failure.
  func appendRedirectQueryItems(to url: URL) throws -> URL {
    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
    var queryItems: [URLQueryItem] = []
    queryItems.append(.init(name: "successUrl", value: Constants.successUrl))
    queryItems.append(.init(name: "failureUrl", value: Constants.failureUrl))
    if urlComponents?.queryItems?.isEmpty ?? true {
      urlComponents?.queryItems = queryItems
    } else {
      urlComponents?.queryItems?.append(contentsOf: queryItems)
    }
    guard let url = urlComponents?.url else {
      throw KryptonimError.invalidParameters
    }
    return url
  }

  private func buildQueryItem(name: String, value: String?) -> URLQueryItem? {
    guard let value = value else { return nil }
    return .init(name: name, value: value)
  }
}
