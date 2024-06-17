/// Represents a customer's credit card information.
/// - Parameters:
///   - cardNumber: Customer’s credit card number
///   - cardCVV: Customer's credit card CVV number
///   - cardHolder: Customer's full name
///   - expiration: Customer’s credit card expiration month and year
public struct CreditCard {
  public let cardNumber: String?
  public let cardCVV: String?
  public let cardHolder: String?
  public let expiration: Expiration?

  /// Represents the expiration date of the credit card.
  /// - Parameters:
  ///   - month: Expiration month
  ///   - year: Expiration year
  public struct Expiration {
    public let month: String
    public let year: String

    public init(month: String, year: String) {
      self.month = month
      self.year = year
    }
  }

  public init(
    cardNumber: String? = nil,
    cardCVV: String? = nil,
    cardHolder: String? = nil,
    expiration: Expiration? = nil
  ) {
    self.cardNumber = cardNumber
    self.cardCVV = cardCVV
    self.cardHolder = cardHolder
    self.expiration = expiration
  }
}
