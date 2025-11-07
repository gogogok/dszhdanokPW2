//
//  WishStoringViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class WishStoringViewController: UIViewController, ClickerSecondDisplayLogic
{
    
    typealias Model = ClickerModel
    
    private let interactor: ClickerBusinessLogic
    
    private var inputText: String = ""
    
    private enum Constants {
        static let numberOfSections : Int = 2
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - LifeCycle
    init(
        interactor: ClickerBusinessLogic
    ) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    private let table = TableConfiguration.CreateTable()
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        configureUI()
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
    
    // MARK: - Actions
    @objc private func addWish() {
        let ip = IndexPath(row: 0, section: 0)
        
        guard let cell = self.table.cellForRow(at: ip) as? AddWishCell else { return }
        let text = (cell.textView.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        
        self.interactor.loadAddWish(Model.PressAddNewWish.Request(text: text))
    }
    
    // MARK: - func
    
    private func configureUI() {
        TableConfiguration.ConfigureTable(table: table, in: view, dataSource: self)
    }
    

    func displayAddWishToArray(_ vm: Model.PressAddNewWish.ViewModel) {
        print("display on:", ObjectIdentifier(self), "text:", vm.text)
        self.wishArray.append(vm.text)
        table.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    //расширение протокола
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                 return wishArray.count
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: AddWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? AddWishCell else { return cell}
            wishCell.bindAddTarget(self, action: #selector(addWish))
            inputText = wishCell.getText() ?? ""
            wishCell.addWish = { [weak self] wish in
                guard let self = self else { return }
                self.wishArray.append(wish)
                self.table.reloadData()
            }
            
            return wishCell
            
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: wishArray[indexPath.row])
            return wishCell
            
        default :
            return UITableViewCell()
        }
        
    }
}
