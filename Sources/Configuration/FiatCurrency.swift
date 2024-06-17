/// An enumeration representing supported fiat currencies.
/// Each case corresponds to a specific fiat currency identified by its ISO 4217 code.
///
/// - Cases:
///   - ars: Argentine Peso (ARS)
///   - aud: Australian Dollar (AUD)
///   - bgn: Bulgarian Lev (BGN)
///   - brl: Brazilian Real (BRL)
///   - cad: Canadian Dollar (CAD)
///   - chf: Swiss Franc (CHF)
///   - clp: Chilean Peso (CLP)
///   - cop: Colombian Peso (COP)
///   - czk: Czech Koruna (CZK)
///   - dkk: Danish Krone (DKK)
///   - eur: Euro (EUR)
///   - gbp: Pound Sterling (GBP)
///   - huf: Forint (HUF)
///   - idr: Rupiah (IDR)
///   - jpy: Yen (JPY)
///   - mxn: Mexican Peso (MXN)
///   - nok: Norwegian Krone (NOK)
///   - nzd: New Zealand Dollar (NZD)
///   - pln: Zloty (PLN)
///   - ron: Romanian Leu (RON)
///   - sar: Saudi Riyal (SAR)
///   - sek: Swedish Krona (SEK)
///   - thb: Baht (THB)
///   - try: Turkish Lira (TRY)
///   - uah: Hryvnia (UAH)
///   - usd: US Dollar (USD)
///   - vnd: Dong (VND)
public enum FiatCurrency: String {
  /// Argentine Peso (ARS)
  case ars = "ARS"

  /// Australian Dollar (AUD)
  case aud = "AUD"

  /// Bulgarian Lev (BGN)
  case bgn = "BGN"

  /// Brazilian Real (BRL)
  case brl = "BRL"

  /// Canadian Dollar (CAD)
  case cad = "CAD"

  /// Swiss Franc (CHF)
  case chf = "CHF"

  /// Chilean Peso (CLP)
  case clp = "CLP"

  /// Colombian Peso (COP)
  case cop = "COP"

  /// Czech Koruna (CZK)
  case czk = "CZK"

  /// Danish Krone (DKK)
  case dkk = "DKK"

  /// Euro (EUR)
  case eur = "EUR"

  /// Pound Sterling (GBP)
  case gbp = "GBP"

  /// Forint (HUF)
  case huf = "HUF"

  /// Rupiah (IDR)
  case idr = "IDR"

  /// Yen (JPY)
  case jpy = "JPY"

  /// Mexican Peso (MXN)
  case mxn = "MXN"

  /// Norwegian Krone (NOK)
  case nok = "NOK"

  /// New Zealand Dollar (NZD)
  case nzd = "NZD"

  /// Zloty (PLN)
  case pln = "PLN"

  /// Romanian Leu (RON)
  case ron = "RON"

  /// Saudi Riyal (SAR)
  case sar = "SAR"

  /// Swedish Krona (SEK)
  case sek = "SEK"

  /// Baht (THB)
  case thb = "THB"

  /// Turkish Lira (TRY)
  case `try` = "TRY"

  /// Hryvnia (UAH)
  case uah = "UAH"

  /// US Dollar (USD)
  case usd = "USD"

  /// Dong (VND)
  case vnd = "VND"
}
