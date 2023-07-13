import UIKit


class CriarTorneio: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    let tableData = ["Nome", "Formato", "Quantidade de Times", "Adicionar Times"]
    let reuseIdentifier = "cellReuseIdentifier"
    let secondTableData = ["Escolher foto", "Escolher existente"]
    let secondReuseIdentifier = "secondCellReuseIdentifier"

    var formatSelected: String?
    var nameTextField: UITextField?
    var quantityStepper: UIStepper?
    var quantityLabel: UILabel?
    var tableView: UITableView!
    var secondTableView: UITableView!
    var camposPreenchidos = [false, false, false]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Criar Torneio"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
        self.navigationItem.title = "Meus Campeonatos"
        


        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        
        
        view.addSubview(tableView)
        

        secondTableView = UITableView()
        secondTableView.translatesAutoresizingMaskIntoConstraints = false
        secondTableView.dataSource = self
        secondTableView.isScrollEnabled = false
        secondTableView.delegate = self
        secondTableView.register(UITableViewCell.self, forCellReuseIdentifier: secondReuseIdentifier)
        secondTableView.layer.cornerRadius = 10
        secondTableView.layer.masksToBounds = true
        //view.addSubview(secondTableView)
        

        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Imagem"
        subtitleLabel.font = UIFont.systemFont(ofSize: 10)
        subtitleLabel.textColor = .black
       //view.addSubview(subtitleLabel)
        
//        let subtitleLabel = UILabel()
//        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        subtitleLabel.text = "Defina imagem de perfil do campeonato"
//        subtitleLabel.font = UIFont.systemFont(ofSize: 10)
//        view.addSubview(subtitleLabel)
        

        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 175.5),

            //secondTableView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 32),
            //secondTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            //secondTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            //secondTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -90),
            
            //subtitleLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 12),
            //subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
            
            

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
                    nameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: cell.contentView.bounds.width - 85, height: cell.contentView.bounds.height))
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

        let mataMataAction = UIAlertAction(title: "Mata-Mata", style: .default) { [weak self] _ in
            self?.formatSelected = "Mata-Mata"
            self?.tableView.reloadData()
            self?.camposPreenchidos[1] = true
        }
        alertController.addAction(mataMataAction)

        let faseGruposAction = UIAlertAction(title: "Fase de Grupos", style: .default) { [weak self] _ in
            self?.formatSelected = "Fase de Grupos"
            self?.tableView.reloadData()
            self?.camposPreenchidos[1] = true
        }
        alertController.addAction(faseGruposAction)

        let faseGruposMataMataAction = UIAlertAction(title: "Fase de Grupos + Mata-Mata", style: .default) { [weak self] _ in
            self?.formatSelected = "Fase de Grupos + Mata-Mata"
            self?.tableView.reloadData()
            self?.camposPreenchidos[1] = true
        }
        alertController.addAction(faseGruposMataMataAction)

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Collaborator Options

    func showCollaboratorOptions() {
        let alertController = UIAlertController(title: "Adicionar Times", message: nil, preferredStyle: .actionSheet)

        let perfilAction = UIAlertAction(title: "Time A", style: .default) { [weak self] _ in
            self?.openPerfil()
        }
        alertController.addAction(perfilAction)

        let linkAction = UIAlertAction(title: "Time B", style: .default) { [weak self] _ in
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
        if formatSelected == "" || formatSelected == nil {
            camposPreenchidos[1] = false
        }
        
        let nomeTorneio = nameTextField?.text
        let formato = FormatoTorneio(rawValue: formatSelected ?? FormatoTorneio.faseGrupos.rawValue)
        let qtdTimes = quantityStepper?.value
        
        for campo in camposPreenchidos {
            if campo == false  {
                // Create a new alert
                var dialogMessage = UIAlertController(title: "Dados incompletos", message: "Preencha todos os campos ", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Fechar", style: .default, handler: nil)
                dialogMessage.addAction(okButton)
                // Present alert to user
                self.present(dialogMessage, animated: true, completion: nil)
                return
            }
        }
        
        Backend.createTorneio(nome: nomeTorneio!, formato: formato!, qtdTimes: Int(qtdTimes!)) { record, error in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Você pode obter o valor do campo de texto aqui
        if textField.text == nil || textField.text!.isEmpty{
            camposPreenchidos[0] = false
        } else {
            camposPreenchidos[0] = true
        }
        if textField == nameTextField, let text = textField.text {
            print("Nome do torneio: \(text)")
        }
    }
    
    // MARK: - UIStepper Action
    
    @objc func quantityStepperValueChanged() {
        camposPreenchidos[2] = true
        if let stepper = quantityStepper {
            quantityLabel?.text = "\(Int(stepper.value))"
        }
    }
}
