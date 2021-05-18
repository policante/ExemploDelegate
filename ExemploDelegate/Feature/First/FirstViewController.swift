import UIKit

final class FirstViewController: UIViewController {
    
    private var customView: FirstView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func loadView() {
        let customView = FirstView(
            newTapAction: handleNewTap
        )
        view = customView
        self.customView = customView
    }

    // MARK: - Actions
    private func handleNewTap(){
        let newViewController = SecondViewController()
        newViewController.delegate = self
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
}

extension FirstViewController: SecondViewDelegate {
    
    func fieldCompleted(_ value: String) {
        customView?.setNewLabel(value)
    }
    
}
