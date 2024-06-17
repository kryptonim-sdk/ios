/// Represents billing information for a customer.
/// - Parameters:
///   - firstName: Customer’s first name
///   - lastName: Customer's last name
///   - city: Customer's city
///   - streetAddress: Customer’s street address
///   - postalCode: Customer’s postal code
///   - country: Customer’s country
///   - countryCode: Customer’s country code
///   - state: Customer’s state
public struct Billing {
  public let firstName: String?
  public let lastName: String?
  public let city: String?
  public let streetAddress: String?
  public let postalCode: String?
  public let country: String?
  public let countryCode: String?
  public let state: String?

  public init(
    firstName: String? = nil,
    lastName: String? = nil,
    city: String? = nil,
    streetAddress: String? = nil,
    postalCode: String? = nil,
    country: String? = nil,
    countryCode: String? = nil,
    state: String? = nil
  ) {
    self.firstName = firstName
    self.lastName = lastName
    self.city = city
    self.streetAddress = streetAddress
    self.postalCode = postalCode
    self.country = country
    self.countryCode = countryCode
    self.state = state
  }
}
