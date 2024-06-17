/// An enumeration representing errors that can occur within the Kryptonim module.
///
/// - Cases:
///   - invalidUrl: Indicates that the provided URL is invalid or cannot be constructed
///   - invalidParameters: Indicates that the provided parameters for constructing the URL are invalid
public enum KryptonimError: Error {
  /// Indicates that the provided URL is invalid or cannot be constructed
  case invalidUrl

  /// Indicates that the provided parameters for constructing the URL are invalid
  case invalidParameters
}
