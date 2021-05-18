import UIKit

final class FirstView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Informe o nome"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("Novo nome", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNewTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    private var newTapAction: () -> Void
    
    // MARK: - Initialization
    
    init(
        newTapAction: @escaping () -> Void
    ) {
        self.newTapAction = newTapAction
        super.init(frame: .zero)
        addView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Não pode ser inicializado por XIB ou Storyboard")
    }
    
    // MARK: - Private API
    private func addView(){
        addSubview(nameLabel)
        addSubview(newButton)
        
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        newButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 22).isActive = true
        newButton.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
    }
    
    private func setupView(){
        backgroundColor = .white
    }
    
    // MARK: - Actions
    @objc private func handleNewTap(){
        newTapAction()
    }
    
    // MARK: - Public API
    func setNewLabel(_ newValue: String){
        nameLabel.text = newValue
    }
    
}
