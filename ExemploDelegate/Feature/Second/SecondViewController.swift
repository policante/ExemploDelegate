import UIKit

protocol SecondViewDelegate {
    
    func fieldCompleted(_ value: String)
    
}

final class SecondViewController: UIViewController {
    
    private var customView: SecondView?
    var delegate: SecondViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Informe o nome"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func loadView() {
        let customView = SecondView(
            fieldCompleted: handleFieldCompleted(value:)
        )
        view = customView
        self.customView = customView
    }

    //MARK: - Actions
    private func handleFieldCompleted(value: String){
        customView?.endEditing(true)
        delegate?.fieldCompleted(value)
        navigationController?.popViewController(animated: true)
    }
    
}
