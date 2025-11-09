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
    
    private weak var addCell: AddWishCell?
    
    private let table = TableConfiguration.CreateTable()
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = Constants.buttonRadius
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .bold)
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        return button
    }()
    
    //я не убирала UserDefaults., а только закомментила, так что можно проверить
    //private let defaults = UserDefaults.standard
    
    // MARK: - Constants
    
    private enum Constants {
        static let numberOfSections : Int = 2
        static let fatalError: String = "init(coder:) has not been implemented"
        static let wishesKey = "userWishes"
        
        static let buttonOffset: CGFloat = 30
        static let buttonWidth: CGFloat = 100
        static let buttonRadius: CGFloat = 12
        static let fontSize: CGFloat = 16
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

    // MARK: - view load
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        //wishArray = defaults.array(forKey: Constants.wishesKey) as? [String] ?? wishArray
        configureUI()
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
        //стереть у себя userdefaults по ключу, чтобы при перезапуске не было новых желаний
        //UserDefaults.standard.removeObject(forKey: Constants.wishesKey)
        
        interactor.loadFetchAll(Model.FetchAll.Request())
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
    
    
    @objc private func editWish(_ sender: UIButton) {
        guard
            let cell = sender.findSuperview(of: WrittenWishCell.self)
        else { return }
        self.interactor.loadEditWish(Model.PressEditWish.Request(cell: cell))
    }
    
    @objc private func editFieldDidChange(_ sender: UITextField) {
        guard
            let cell = sender.findSuperview(of: WrittenWishCell.self),
            let indexPath = table.indexPath(for: cell)
        else { return }
        self.interactor.loadFinishEditWish(Model.PressEnterFinishEditWish.Request(cell: cell, index: indexPath))
    }
    
    @objc private func shareTapped() {
        interactor.loadShareWishes(Model.ShareWishes.Request())
    }
    
    
    //MARK: - configure func
    
    private func configureUI() {
        view.addSubview(shareButton)
        shareButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.buttonOffset)
        shareButton.pinHorizontal(to: view, Constants.buttonOffset)
        TableConfiguration.ConfigureTable(table: table, in: view, dataSource: self)
        table.contentInset.top = 60
        view.bringSubviewToFront(shareButton)
    }
    
    //MARK: - DisplayLogic func
    
    func displayAddWishToArray(_ vm: Model.PressAddNewWish.ViewModel) {
        addCell?.addWish?(vm.text)
    }
    
    func displayDeleteWish( _ vm: Model.PressDeleteWish.ViewModel) {
        wishArray.remove(at: self.wishArray.firstIndex(of: vm.text)!)
        //defaults.set(wishArray, forKey: Constants.wishesKey)
        table.reloadData()
    }
    
    
    func displayEditedWish(_ vm: Model.PressEditWish.ViewModel) {
        vm.cell.setEditingMode(enabled: true)
    }
    
    func displayFinishEditingWish(_ vm: Model.PressEnterFinishEditWish.ViewModel) {
        vm.cell.setEditingMode(enabled: false)
        let text = vm.cell.getTextFieldText()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? vm.cell.getTextLabelText()
        wishArray[vm.index.row] = (text ?? vm.cell.getTextLabelText()) ?? ""
        //defaults.set(wishArray, forKey: Constants.wishesKey)
        table.reloadData()
    }
    
    func displayFetched(_ vm: Model.FetchAll.ViewModel) {
           wishArray = vm.texts
           table.reloadData()
       }
    
    func shareWishes(_ vm: Model.ShareWishes.ViewModel) {
        let av = UIActivityViewController(activityItems: [vm.fileURL], applicationActivities: nil)
        present(av, animated: true)
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
                //defaults.set(wishArray, forKey: Constants.wishesKey)
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
            wishCell.editButtonAddTarget(self, action: #selector(editWish(_:)))
            wishCell.editFieldAddTarget(self, action: #selector(editFieldDidChange(_:)))
            
            return wishCell
            
        default :
            return UITableViewCell()
        }
        
    }
}
