/// An enumeration representing the available payment methods.
/// Each case corresponds to a specific payment method.
///
/// - Cases:
///   - card: Represents a payment made using a credit or debit card
///   - bank: Represents a payment made using a bank transfer
public enum PaymentMethod: String {
  /// Represents a payment made using a credit or debit card
  case card

  /// Represents a payment made using a bank transfer
  case bank
}
