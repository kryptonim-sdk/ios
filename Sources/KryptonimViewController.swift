import UIKit
import SwiftUI

public class KryptonimViewController: UIViewController {

  private var hostingController: UIHostingController<KryptonimView>!
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
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func viewDidLoad() {
    super.viewDidLoad()

    let kryptonimView = KryptonimView(configuration: configuration, resultHandler: resultHandler, errorHandler: errorHandler)
    hostingController = UIHostingController(rootView: kryptonimView)

    addChild(hostingController)
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(hostingController.view)
    
    NSLayoutConstraint.activate([
      hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    hostingController.didMove(toParent: self)
  }

}
