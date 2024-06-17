/// An enumeration representing various supported networks.
/// Each case corresponds to a specific blockchain network.
///
/// - Cases:
///   - arbitrum: Represents the Arbitrum blockchain network
///   - avalanche: Represents the Avalanche blockchain network
///   - bitcoin: Represents the Bitcoin blockchain network
///   - ethereum: Represents the Ethereum blockchain network
///   - optimism: Represents the Optimism blockchain network
///   - polygon: Represents the Polygon blockchain network
///   - solana: Represents the Solana blockchain network
///   - tron: Represents the TRON blockchain network
public enum Blockchain: String {
  /// Represents the Arbitrum blockchain network
  case arbitrum = "Arbitrum"

  /// Represents the Avalanche blockchain network
  case avalanche = "Avalanche"

  /// Represents the Bitcoin blockchain network
  case bitcoin = "Bitcoin"

  /// Represents the Ethereum blockchain network
  case ethereum = "Ethereum"

  /// Represents the Optimism blockchain network
  case optimism = "Optimism"

  /// Represents the Polygon blockchain network
  case polygon = "Polygon"

  /// Represents the Solana blockchain network
  case solana = "Solana"

  /// Represents the TRON blockchain network
  case tron = "Tron"
}
