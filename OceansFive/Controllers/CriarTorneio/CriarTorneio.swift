import UIKit

class CriarTorneio: UIViewController {
    
    
    override func viewDidLoad() {
        setUpAppBar()
        
        buildLayout()
    }
    
    func buildLayout() {
        let layout = view.safeAreaLayoutGuide
        let firstSection = createSection(numberOfRows: 4, rowHeight: 25)
        view.addSubview(firstSection)
        NSLayoutConstraint.activate([
            firstSection.topAnchor.constraint(equalTo: layout.topAnchor, constant: 16),
            firstSection.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 16),
            firstSection.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -16),
        ])
    }
    
    func createSection(numberOfRows: Int, rowHeight: Int) -> UIView {
        let section = UIView()
        section.layer.cornerRadius = CGFloat(8)
        section.translatesAutoresizingMaskIntoConstraints = false
        section.heightAnchor.constraint(equalToConstant: CGFloat(numberOfRows * rowHeight)).isActive = true
        section.backgroundColor = .red
        return section
    }
    
    func setUpAppBar() {
        self.title = "Criar Torneio"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(criarCampeonato))
    }
    
    @objc func criarCampeonato() {
        print("button salvar pressionado")
    }
}
