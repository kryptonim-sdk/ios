/// Represents transaction details.
/// - Parameters:
///   - amount: Amount in the Fiat currency
///   - currency: Fiat currency
///   - convertedAmount: Amount in the Cryptocurrency
///   - convertedCurrency: Cryptocurrency
///   - blockchain: Wallet's Network
///   - walletAddress: Customer's wallet address
///   - paymentMethod: The selected payment method ('card', 'bank'). Note that the "bank" payment method is only available for Euro fiat currency
///   - customerMail: Customer’s e-mail address
///   - m: Merchant identificator
public struct Transaction {
  public let amount: String?
  public let currency: FiatCurrency?
  public let convertedAmount: String?
  public let convertedCurrency: CryptoCurrency?
  public let blockchain: Blockchain?
  public let walletAddress: String?
  public let paymentMethod: PaymentMethod?
  public let customerMail: String?
  public let m: String?

  public init(
    amount: String? = nil,
    currency: FiatCurrency? = nil,
    convertedAmount: String? = nil,
    convertedCurrency: CryptoCurrency? = nil,
    blockchain: Blockchain? = nil,
    walletAddress: String? = nil,
    paymentMethod: PaymentMethod? = nil,
    customerMail: String? = nil,
    m: String? = nil
  ) {
    self.amount = amount
    self.currency = currency
    self.convertedAmount = convertedAmount
    self.convertedCurrency = convertedCurrency
    self.blockchain = blockchain
    self.walletAddress = walletAddress
    self.paymentMethod = paymentMethod
    self.customerMail = customerMail
    self.m = m
  }
}
