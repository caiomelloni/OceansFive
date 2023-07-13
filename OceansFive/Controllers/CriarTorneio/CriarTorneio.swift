import UIKit
import CloudKit

class CriarTorneio: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    let tableData = ["Nome", "Formato", "Quantidade de Times", "Adicionar Colaboradores"]
    let reuseIdentifier = "cellReuseIdentifier"
    let secondTableData = ["Escolher foto", "Escolher existente"]
    let secondReuseIdentifier = "secondCellReuseIdentifier"

    var formatSelected: String?
    var nameTextField: UITextField?
    var quantityStepper: UIStepper?
    var quantityLabel: UILabel?
    var tableView: UITableView!
    var secondTableView: UITableView!
    private lazy var logo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 10

        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.logo.image = UIImage(named: "Image")
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.text = "Criar Torneio"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .white
        titleLabel.layer.cornerRadius = 4
        titleLabel.layer.masksToBounds = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        view.addSubview(tableView)


        secondTableView = UITableView()
        secondTableView.translatesAutoresizingMaskIntoConstraints = false
        secondTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.register(UITableViewCell.self, forCellReuseIdentifier: secondReuseIdentifier)

        view.addSubview(secondTableView)
        view.addSubview(logo)



        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200),

            secondTableView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 16),
            secondTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),

            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200),
            logo.topAnchor.constraint(equalTo: secondTableView.bottomAnchor, constant: 10),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100)



        ])

        let saveButton = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return tableData.count
        } else if tableView == secondTableView {
            return secondTableData.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

            if indexPath.row == 0 {
                cell.textLabel?.text = tableData[indexPath.row]

                if nameTextField == nil {
                    nameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: cell.contentView.bounds.width - 30, height: cell.contentView.bounds.height))
                    nameTextField?.placeholder = "Digite o nome do torneio"
                    nameTextField?.delegate = self
                }

                cell.accessoryView = nameTextField
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "Formato: \(formatSelected ?? "")"
               cell.accessoryView = nil
            } else if indexPath.row == 2 {
                cell.textLabel?.text = "Quantidade de Times"

                let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 150, height: cell.contentView.bounds.height))
                stackView.axis = .horizontal
                stackView.alignment = .center
                stackView.distribution = .fill
                stackView.spacing = 8

                if quantityLabel == nil {
                    quantityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: cell.contentView.bounds.height))
                    quantityLabel?.textAlignment = .center
                }

                if quantityStepper == nil {
                    quantityStepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 100, height: cell.contentView.bounds.height))
                    quantityStepper?.minimumValue = 2
                    quantityStepper?.maximumValue = 20
                    quantityStepper?.stepValue = 1
                    quantityStepper?.value = 2
                    quantityStepper?.addTarget(self, action: #selector(quantityStepperValueChanged), for: .valueChanged)
                }

                stackView.addArrangedSubview(quantityLabel!)
                stackView.addArrangedSubview(quantityStepper!)

                cell.accessoryView = stackView
            } else if indexPath.row == 3 {
                cell.textLabel?.text = tableData[indexPath.row]
                cell.accessoryView = nil
                cell.accessoryType = .disclosureIndicator
            } else {
                cell.textLabel?.text = tableData[indexPath.row]
                cell.accessoryView = nil
                cell.accessoryType = .none
            }

            return cell
        } else if tableView == secondTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: secondReuseIdentifier, for: indexPath)
            cell.textLabel?.text = secondTableData[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        }

        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if tableView == self.tableView {
            if indexPath.row == 1 {
                showFormatOptions()
            } else if indexPath.row == 3 {
                showCollaboratorOptions()
            }
        } else if tableView == secondTableView {
            if indexPath.row == 0 {
                // Lógica para escolher uma foto
                print("Escolher foto")
            } else if indexPath.row == 1 {
                // Lógica para escolher uma foto existente
                print("Escolher existente")
            }
        }
    }

    // MARK: - Format Options

    func showFormatOptions() {
        let alertController = UIAlertController(title: "Formato", message: nil, preferredStyle: .actionSheet)

        let mataMataAction = UIAlertAction(title: FormatoTorneio.mataMata.rawValue, style: .default) { [weak self] _ in
            self?.formatSelected = "Mata-Mata"
            self?.tableView.reloadData()
        }
        alertController.addAction(mataMataAction)

        let faseGruposAction = UIAlertAction(title: FormatoTorneio.faseGrupos.rawValue, style: .default) { [weak self] _ in
            self?.formatSelected = "Fase de Grupos"
            self?.tableView.reloadData()
        }
        alertController.addAction(faseGruposAction)

        let faseGruposMataMataAction = UIAlertAction(title: FormatoTorneio.faseGruposMaisMataMata.rawValue, style: .default) { [weak self] _ in
            self?.formatSelected = "Fase de Grupos + Mata-Mata"
            self?.tableView.reloadData()
        }
        alertController.addAction(faseGruposMataMataAction)

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Collaborator Options

    func showCollaboratorOptions() {
        let alertController = UIAlertController(title: "Adicionar Colaborador", message: nil, preferredStyle: .actionSheet)

        let perfilAction = UIAlertAction(title: "Perfil", style: .default) { [weak self] _ in
            self?.openPerfil()
        }
        alertController.addAction(perfilAction)

        let linkAction = UIAlertAction(title: "Link", style: .default) { [weak self] _ in
            self?.openLink()
        }
        alertController.addAction(linkAction)

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    func openPerfil() {
        // Implemente a lógica para abrir a tela de perfil aqui
        print("Abrir tela de perfil")
    }

    func openLink() {
        // Implemente a lógica para abrir a tela com um link aqui
        print("Abrir tela com link")
    }

    // MARK: - Button Actions

    @objc func saveButtonTapped() {
        // Lógica para salvar os dados
        print("botão salver pressionado")

        let nomeTorneio = nameTextField?.text
        let formato = FormatoTorneio(rawValue: formatSelected ?? FormatoTorneio.faseGrupos.rawValue)
        let qtdTimes = quantityStepper?.value

        Backend.createTorneio(nome: nomeTorneio!, formato: formato!, qtdTimes: Int(qtdTimes!)) { record, error in
           // lidar com handler de erro e feedback ao usuari
        }

    }

    // MARK: - UITextFieldDelegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Você pode obter o valor do campo de texto aqui
        if textField == nameTextField, let text = textField.text {
            print("Nome do torneio: \(text)")
        }
    }

    // MARK: - UIStepper Action

    @objc func quantityStepperValueChanged() {
        if let stepper = quantityStepper {
            quantityLabel?.text = "\(Int(stepper.value))"
        }
    }
}
