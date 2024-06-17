# Kryptonim iOS SDK

The Kryptonim iOS SDK is a library that allows you to easily integrate Kryptonim payments into your app. If you want to add Kryptonim payments to your app without using the SDK, you can do so using a browser. Check [here](https://github.com/kryptonim-sdk/ios-webview-demo).

Full API documentation can be found [here](https://www.kryptonim.com/api-documentation).

## Installation
### Swift Package Manager
[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift packages. It’s integrated with the Swift build system and Xcode.
To integrate Kryptonim into your project using Swift Package Manager, add it to your Xcode project or to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/kryptonim-sdk/ios.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

Use `KryptonimView` (SwiftUI) or `KryptonimViewController` (UIKit) which has three parameters:
```swift
init(
    configuration: Configuration,
    resultHandler: ((TransactionResult) -> Void)? = nil,
    errorHandler: ((KryptonimError) -> Void)? = nil
)
```
- `configuration`: Create a `Configuration` object with all data you want to pass as parameters so your app user doesn't have to fill them during transaction process. All parameters and restrictions on their use can be checked [here](https://www.kryptonim.com/api-documentation).
- `resultHandler`: Called when transaction process finishes with either success or failure.
- `errorHandler`: Called when any error occurs during the creation of the transaction.

You can see an example usage below.

Note:
The examples below are just to simply show you how to use `KryptonimView` and `KryptonimViewController`.
In real use, we recommend embedding it in a view with separate navigation that will allow you to close the window if the user wants to abandon the purchasing process and react appropriately to these actions.

### SwiftUI
```swift
.sheet(isPresented: $showKryptonimView) {
  KryptonimView(
    configuration: buildKryptonimConfig(),
    resultHandler: handleKryptonimResult(_:), 
    errorHandler: { error in
      print("Error: \(error)")
    }
  )
}

private func buildKryptonimConfig() -> Configuration {
  let configuration = Configuration(
    // 'Environment' defaults to .production. Select .sandbox for a test environment.
    environment: .sandbox,
    transaction: .init(
      amount: "0.5",
      currency: .eur,
      convertedCurrency: .usdc,
      blockchain: .polygon,
      walletAddress: "0x7BHcc84710728EB39aA4d460418816C3FfW28977"
    ),
    creditCard: .init(
      cardNumber: "11111111111111",
      cardCVV: "111",
      cardHolder: "John Smith"
    ),
    theme: .dark
  )
  return configuration
}
  
private func handleKryptonimResult(_ result: KryptonimView.TransactionResult) {
  showKryptonimView = false
  switch result {
  case .success:
    print("SUCCESS")
  case .failure:
    print("FAILURE")
  }
}
```

### UIKit
```swift
class DemoViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let button = UIButton(type: .system)
    button.setTitle("Present KryptonimViewController", for: .normal)
    button.addTarget(self, action: #selector(presentKryptonimViewController), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)

    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  @objc private func presentKryptonimViewController() {
    let kryptonimViewController = KryptonimViewController(
      configuration: buildKryptonimConfig(),
      resultHandler: { [weak self] in self?.handleKryptonimResult($0) },
      errorHandler: { error in
        print("Error: \(error)")
      }
    )
    present(kryptonimViewController, animated: true, completion: nil)
  }

  private func buildKryptonimConfig() -> Configuration {
    let configuration = Configuration(
      // 'Environment' defaults to .production. Select .sandbox for a test environment.
      environment: .sandbox,
      transaction: .init(
        amount: "0.5",
        currency: .eur,
        convertedCurrency: .usdc,
        blockchain: .polygon,
        walletAddress: "0x7BHcc84710728EB39aA4d460418816C3FfW28977"
      ),
      creditCard: .init(
        cardNumber: "11111111111111",
        cardCVV: "111",
        cardHolder: "John Smith"
      ),
      theme: .dark
    )
    return configuration
  }

  private func handleKryptonimResult(_ result: KryptonimView.TransactionResult) {
    self.dismiss(animated: true, completion: nil)
    switch result {
    case .success:
      print("SUCCESS")
    case .failure:
      print("FAILURE")
    }
  }

}
```
