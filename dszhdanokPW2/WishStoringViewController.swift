//
//  WishStoringViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    private let table = TableConfiguration.CreateTable()
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        configureUI()
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
    }
    
    private func configureUI() {
        TableConfiguration.ConfigureTable(table: table, in: view, dataSource: self)
    }
    
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    //расширение протокола
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: WrittenWishCell.reuseId,
            for: indexPath
        )
        guard let wishCell = cell as? WrittenWishCell else { return cell }
        wishCell.configure(with: wishArray[indexPath.row])
        return wishCell
    }
}
