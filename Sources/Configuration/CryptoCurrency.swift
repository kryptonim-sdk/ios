/// An enumeration representing supported cryptocurrencies.
/// Each case corresponds to a specific cryptocurrency and its associated symbol.
///
/// - Cases:
///   - dai: Represents the cryptocurrency DAI
///   - arb: Represents the cryptocurrency ARB
///   - wbtc: Represents Wrapped Bitcoin (WBTC)
///   - usdc: Represents USD Coin (USDC)
///   - usdt: Represents Tether (USDT)
///   - eth: Represents Ethereum (ETH)
///   - avax: Represents Avalanche (AVAX)
///   - btc: Represents Bitcoin (BTC)
///   - uni: Represents Uniswap (UNI)
///   - matic: Represents Polygon (MATIC)
///   - shib: Represents Shiba Inu (SHIB)
///   - tusd: Represents TrueUSD (TUSD)
///   - busd: Represents Binance USD (BUSD)
///   - weth: Represents Wrapped Ether (WETH)
///   - sol: Represents Solana (SOL)
///   - trx: Represents TRON (TRX)
public enum CryptoCurrency: String {
  /// Represents the cryptocurrency DAI
  case dai = "DAI"

  /// Represents the cryptocurrency ARB
  case arb = "ARB"

  /// Represents Wrapped Bitcoin (WBTC)
  case wbtc = "WBTC"

  /// Represents USD Coin (USDC)
  case usdc = "USDC"

  /// Represents Tether (USDT)
  case usdt = "USDT"

  /// Represents Ethereum (ETH)
  case eth = "ETH"

  /// Represents Avalanche (AVAX)
  case avax = "AVAX"

  /// Represents Bitcoin (BTC)
  case btc = "BTC"

  /// Represents Uniswap (UNI)
  case uni = "UNI"

  /// Represents Polygon (MATIC)
  case matic = "MATIC"

  /// Represents Shiba Inu (SHIB)
  case shib = "SHIB"

  /// Represents TrueUSD (TUSD)
  case tusd = "TUSD"

  /// Represents Binance USD (BUSD)
  case busd = "BUSD"

  /// Represents Wrapped Ether (WETH)
  case weth = "WETH"

  /// Represents Solana (SOL)
  case sol = "SOL"

  /// Represents TRON (TRX)
  case trx = "TRX"
}
