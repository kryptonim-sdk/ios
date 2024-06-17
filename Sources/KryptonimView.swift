import SwiftUI
import WebKit

public struct KryptonimView: UIViewRepresentable {

  private let configuration: Configuration
  private let resultHandler: ((TransactionResult) -> Void)?
  private let errorHandler: ((KryptonimError) -> Void)?

  public init(
    configuration: Configuration,
    resultHandler: ((TransactionResult) -> Void)? = nil,
    errorHandler: ((KryptonimError) -> Void)? = nil
  ) {
    self.configuration = configuration
    self.resultHandler = resultHandler
    self.errorHandler = errorHandler
  }

  public func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    webView.allowsLinkPreview = true
    do {
      var url = try configuration.buildUrlWithParameters()
      if resultHandler != nil {
        url = try configuration.appendRedirectQueryItems(to: url)
      }
      let request = URLRequest(url: url)
      webView.load(request)
    } catch {
      if let error = error as? KryptonimError {
        errorHandler?(error)
      }
    }
    return webView
  }

  public func updateUIView(_ uiView: WKWebView, context: Context) {
    do {
      var url = try configuration.buildUrlWithParameters()
      if resultHandler != nil {
        url = try configuration.appendRedirectQueryItems(to: url)
      }
      let request = URLRequest(url: url)
      uiView.load(request)
    } catch {
      if let error = error as? KryptonimError {
        errorHandler?(error)
      }
    }
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(configuration: configuration, resultHandler: resultHandler)
  }

  public class Coordinator: NSObject, WKNavigationDelegate {
    private let resultHandler: ((TransactionResult) -> Void)?
    private let configuration: Configuration

    public init(
      configuration: Configuration,
      resultHandler: ((TransactionResult) -> Void)?
    ) {
      self.configuration = configuration
      self.resultHandler = resultHandler
    }

    public func webView(
      _ webView: WKWebView,
      decidePolicyFor navigationAction: WKNavigationAction,
      decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
      guard let resultHandler,
            let url = navigationAction.request.url,
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
      else {
        decisionHandler(.allow)
        return
      }
      let urlString = components.url?.absoluteString
      if urlString == Constants.successUrl {
        decisionHandler(.cancel)
        resultHandler(.success)
      } else if urlString == Constants.failureUrl {
        decisionHandler(.cancel)
        resultHandler(.failure)
      } else {
        decisionHandler(.allow)
      }
    }
  }

}
