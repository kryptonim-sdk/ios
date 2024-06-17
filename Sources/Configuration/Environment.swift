/// An enumeration representing the environment in which a transaction will be processed.
/// The environment determines whether the transaction is processed in a testing or live production setting.
///
/// - Cases:
///   - test: Use this environment for testing transactions. Transactions processed in this environment will not be real and will not affect real accounts or funds.
///   - sandbox: Use this environment for live transactions. Transactions processed in this environment are real and will affect real accounts and funds.
public enum Environment {
  case sandbox
  case production
}
