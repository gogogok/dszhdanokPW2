//
//  WishStoringViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    private let table = TableConfiguration.CreateTable()
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        configureUI()
    }
    
    private func configureUI() {
        TableConfiguration.ConfigureTable(table: table, in: view, dataSource: self)
    }
    
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    //расширение протокола
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
