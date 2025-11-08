//
//  WishStoringViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class WishStoringViewController: UIViewController
{
    // MARK: - Fields
    typealias Model = ClickerModel
    
    private let interactor: ClickerBusinessLogic
    
    private var inputText: String = ""
    
    private let defaults = UserDefaults.standard
    
    private weak var addCell: AddWishCell?
    
    private let table = TableConfiguration.CreateTable()
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
    // MARK: - Constants
    
    private enum Constants {
        static let numberOfSections : Int = 2
        static let fatalError: String = "init(coder:) has not been implemented"
        static let wishesKey = "userWishes"
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

    
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        wishArray = defaults.array(forKey: Constants.wishesKey) as? [String] ?? wishArray
        configureUI()
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
        //стереть у себя userdefaults по ключу, чтобы при перезапуске не было новых желаний
        UserDefaults.standard.removeObject(forKey: Constants.wishesKey)
    }
    
    // MARK: - Actions
    @objc private func addWish() {
        let ip = IndexPath(row: 0, section: 0)
        
        guard let cell = self.table.cellForRow(at: ip) as? AddWishCell else { return }
        let text = (cell.textView.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        
        self.interactor.loadAddWish(Model.PressAddNewWish.Request(text: text))
        
        cell.textView.text = ""
        
    }
    
    @objc private func deleteWish(_ sender: UIButton) {
        guard
            let cell = sender.findSuperview(of: WrittenWishCell.self),
            let indexPath = table.indexPath(for: cell)
        else { return }
        
        let text = wishArray[indexPath.row]
        self.interactor.loadDeleteWish(Model.PressDeleteWish.Request(text: text))
    }
    
    @objc private func editWish() {
        //по нажатию энер можно активировать событие, подписчик которого текстовое поле ввода
    }
    
    
    
    // MARK: - func
    
    private func configureUI() {
        TableConfiguration.ConfigureTable(table: table, in: view, dataSource: self)
    }
    

    func displayAddWishToArray(_ vm: Model.PressAddNewWish.ViewModel) {
        addCell?.addWish?(vm.text)
    }
    
    func displayDeleteWish( _ vm: Model.PressDeleteWish.ViewModel) {
        self.wishArray.remove(at: self.wishArray.firstIndex(of: vm.text)!)
        defaults.set(wishArray, forKey: Constants.wishesKey)
        table.reloadData()
    }
    
    
    func displayEditedWish(_ vm: Model.PressEditWish.ViewModel) {
        
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
            addCell = wishCell
            wishCell.addWish = { [weak self] wish in
                guard let self = self else { return }
                self.wishArray.append(wish)
                defaults.set(wishArray, forKey: Constants.wishesKey)
                table.reloadData()
            }
            
            return wishCell
            
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: wishArray[indexPath.row])
            wishCell.deleteButtonAddTarget(self, action: #selector(deleteWish(_:)))
            wishCell.editButtonAddTarget(self, action: #selector(editWish))
            
            return wishCell
            
        default :
            return UITableViewCell()
        }
        
    }
}
