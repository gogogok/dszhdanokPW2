//
//  TableConfiguration.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class TableConfiguration {
    
    private enum Constants {
        static let tableCornerRadius: CGFloat = 5
        static let tableOffset: CGFloat = 20
        static let buttonTitle : String = "New wish"
        
        static let corner: CGFloat = 10
        static let fontSize: CGFloat = 16
    }
    
    static func CreateTable() -> UITableView{
        let table: UITableView = UITableView(frame: .zero)
        table.backgroundColor = .red
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        return table
    }
    
    static func ConfigureTable(table: UITableView, in view: UIView, dataSource: UITableViewDataSource) {
        
        view.addSubview(table)
        table.pin(to: view, Constants.tableOffset)
        table.dataSource = dataSource
    }
    
}

