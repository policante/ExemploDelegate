import UIKit

final class SecondView: UIView {
    
    private lazy var textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Preencha com o nome"
        field.keyboardType = .default
        field.textContentType = .name
        field.delegate = self
        field.returnKeyType = .go
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    // MARK: - Properties
    
    private let fieldCompleted: (String) -> Void
    
    init(
        fieldCompleted: @escaping (String) -> Void
    ) {
        self.fieldCompleted = fieldCompleted
        super.init(frame: .zero)
        addView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Não pode ser inicializado por XIB ou Storyboard")
    }
    
    // MARK: - Private API
    private func addView(){
        addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupView(){
        backgroundColor = .white
    }
    
}

extension SecondView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        fieldCompleted(text)
        return true
    }
    
}
